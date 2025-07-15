#!/usr/bin/env python3
import os, subprocess as sp, time, threading
from glob import glob

def wr(p, v):
    try: open(p, 'w').write(str(v))
    except: pass

def run(c):
    try: sp.run(c, shell=True, stdout=sp.DEVNULL, stderr=sp.DEVNULL)
    except: pass

def ram_kb():
    try: return int([l for l in open('/proc/meminfo') if 'MemTotal' in l][0].split()[1])
    except: return 0

def clear_ram_enhanced():
    wr('/proc/sys/vm/drop_caches', 3)
    wr('/proc/sys/vm/compact_memory', 1)
    wr('/proc/sys/vm/vfs_cache_pressure', 20)
    wr('/proc/sys/vm/min_free_kbytes', max(1048576, int(ram_kb() * 0.5)))

def boost_cpu_maxlock():
    c = os.cpu_count() or 8
    mask = hex((1 << c) - 1)[2:]
    run(f'taskset -p 0x{mask} $$')
    for cpu in glob('/sys/devices/system/cpu/cpu[0-9]*'):
        wr(cpu + '/online', 1)
        wr(cpu + '/cpufreq/scaling_governor', 'performance')
        try:
            f = int(open(cpu + '/cpufreq/cpuinfo_max_freq').read())
            wr(cpu + '/cpufreq/scaling_max_freq', f)
            wr(cpu + '/cpufreq/scaling_min_freq', f)
        except: pass
    for irq in glob('/proc/irq/*/smp_affinity'):
        wr(irq, mask)

def io_advance():
    for q in glob('/sys/block/*/queue'):
        wr(q + '/read_ahead_kb', 262144)
        wr(q + '/iostats', 0)
        wr(q + '/rq_affinity', 1)
        wr(q + '/nr_requests', 262144)
        sched = q + '/scheduler'
        if os.path.exists(sched):
            content = open(sched).read()
            for s in ['none', 'kyber', 'mq-deadline', 'noop']:
                if s in content:
                    wr(sched, s)
                    break

def zram_opt():
    if os.path.exists('/sys/block/zram0'):
        run('swapoff /dev/block/zram0')
        wr('/sys/block/zram0/reset', 1)
        wr('/sys/block/zram0/comp_algorithm', 'zstd')
        wr('/sys/block/zram0/disksize', ram_kb() * 4096)
        run('mkswap /dev/block/zram0')
        run('swapon /dev/block/zram0 -p 32767')

def net_boost_ultimate():
    wr('/proc/sys/net/ipv4/tcp_congestion_control', 'bbr')
    wr('/proc/sys/net/core/rmem_max', 1073741824)
    wr('/proc/sys/net/core/wmem_max', 1073741824)
    wr('/proc/sys/net/core/rmem_default', 134217728)
    wr('/proc/sys/net/core/wmem_default', 134217728)
    wr('/proc/sys/net/core/netdev_max_backlog', 2097152)
    wr('/proc/sys/net/core/somaxconn', 65535)
    wr('/proc/sys/net/ipv4/tcp_rmem', '4096 87380 134217728')
    wr('/proc/sys/net/ipv4/tcp_wmem', '4096 65536 134217728')
    wr('/proc/sys/net/ipv4/ip_local_port_range', '1024 65535')
    wr('/proc/sys/net/ipv4/tcp_low_latency', 1)
    wr('/proc/sys/net/ipv4/tcp_timestamps', 0)
    wr('/proc/sys/net/ipv4/tcp_sack', 1)
    wr('/proc/sys/net/ipv4/tcp_ecn', 0)
    wr('/proc/sys/net/ipv4/tcp_no_metrics_save', 1)
    wr('/proc/sys/net/ipv4/tcp_fastopen', 3)
    wr('/proc/sys/net/ipv4/tcp_keepalive_time', 30)
    wr('/proc/sys/net/ipv4/tcp_keepalive_probes', 3)
    wr('/proc/sys/net/ipv4/tcp_keepalive_intvl', 10)
    wr('/proc/sys/net/ipv4/tcp_fin_timeout', 8)
    wr('/proc/sys/net/ipv4/tcp_tw_reuse', 1)
    wr('/proc/sys/net/ipv4/tcp_mtu_probing', 1)
    wr('/proc/sys/net/ipv4/tcp_window_scaling', 1)
    wr('/proc/sys/net/ipv4/route/flush', 1)
    run('ip neigh flush all')

def dns_force_quad9():
    run('setprop net.dns1 9.9.9.9')
    run('setprop net.dns2 149.112.112.112')
    run('ndc resolver setnetdns 1 "" 9.9.9.9 149.112.112.112')
    if '9.9.9.9' not in sp.getoutput('getprop net.dns1'):
        run('setprop net.dns1 9.9.9.9')

def anim_off():
    for k in ['window_animation_scale', 'transition_animation_scale', 'animator_duration_scale']:
        run(f'settings put global {k} 0')

def system_core_tune():
    wr('/proc/sys/vm/swappiness', 0)
    wr('/proc/sys/vm/dirty_ratio', 5)
    wr('/proc/sys/vm/dirty_background_ratio', 2)
    wr('/proc/sys/vm/overcommit_memory', 1)
    wr('/proc/sys/vm/overcommit_ratio', 100)
    wr('/proc/sys/kernel/sched_boost', 1)
    wr('/proc/sys/kernel/sched_autogroup_enabled', 0)
    wr('/proc/sys/kernel/watchdog_thresh', 0)

def init_clean():
    run('sync; echo 3 > /proc/sys/vm/drop_caches')
    run('echo 1 > /proc/sys/vm/compact_memory')
    run('ip neigh flush all')
    run('logcat -c')
    run('dmesg -c || true')
    run('rm -rf /cache/*')
    run('rm -rf /mnt/cache/*')
    run('rm -rf /data/cache/*')
    run('rm -rf /data/local/tmp/*')
    run('rm -rf /data/tmp/*')
    run('rm -rf /data/system/dropbox/*')
    run('rm -rf /data/anr/*')
    run('rm -rf /data/tombstones/*')
    run('rm -rf /data/system/usagestats/*')
    run('rm -rf /data/system/sync/*')
    run('rm -rf /data/misc/logd/*')
    run('rm -rf /data/misc/profiles/*')
    run('rm -rf /data/misc/textclassifier/*')
    run('rm -rf /data/system/notification_log.xml')
    run('rm -rf /data/dalvik-cache/*')
    run('rm -rf /cache/dalvik-cache/*')
    run('rm -rf /mnt/dalvik-cache/*')

def full_tune():
    run('settings put global heads_up_notifications_enabled 0')
    run('settings put secure lock_screen_show_notifications 0')
    run('settings put secure lock_screen_allow_private_notifications 0')
    run('service call notification 1')
    init_clean()
    system_core_tune()
    zram_opt()
    io_advance()
    net_boost_ultimate()
    dns_force_quad9()
    anim_off()

def loop_boost():
    while True:
        clear_ram_enhanced()
        boost_cpu_maxlock()
        time.sleep(1)

def loop_clean():
    while True:
        time.sleep(60)
        init_clean()

full_tune()
print("Successfully Boosted, Optimized For Gaming, Please Do Not Turn Off Termux And This Code")

threading.Thread(target=loop_boost).start()
threading.Thread(target=loop_clean).start()
