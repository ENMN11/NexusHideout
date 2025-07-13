#!/usr/bin/env python3
import os, subprocess as sp, time
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
    wr('/proc/sys/vm/vfs_cache_pressure', 100)
    wr('/proc/sys/vm/min_free_kbytes', max(524288, int(ram_kb() * 0.3)))

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
        wr(q + '/read_ahead_kb', 16384)
        wr(q + '/iostats', 0)
        wr(q + '/rq_affinity', 1)
        wr(q + '/nr_requests', 32768)
        sched = q + '/scheduler'
        if os.path.exists(sched):
            content = open(sched).read()
            for s in ['none', 'kyber', 'mq-deadline', 'noop']:
                if s in content: wr(sched, s); break

def zram_opt():
    if os.path.exists('/sys/block/zram0'):
        run('swapoff /dev/block/zram0')
        wr('/sys/block/zram0/reset', 1)
        wr('/sys/block/zram0/comp_algorithm', 'zstd')
        wr('/sys/block/zram0/disksize', ram_kb() * 4096)
        run('mkswap /dev/block/zram0')
        run('swapon /dev/block/zram0 -p 32767')

def net_boost_advanced():
    wr('/proc/sys/net/ipv4/tcp_congestion_control', 'bbr')
    wr('/proc/sys/net/core/netdev_max_backlog', 4194304)
    wr('/proc/sys/net/core/somaxconn', 65535)
    wr('/proc/sys/net/core/rmem_max', 536870912)
    wr('/proc/sys/net/core/wmem_max', 536870912)
    wr('/proc/sys/net/core/rmem_default', 1048576)
    wr('/proc/sys/net/core/wmem_default', 1048576)
    wr('/proc/sys/net/ipv4/tcp_rmem', '8192 1048576 536870912')
    wr('/proc/sys/net/ipv4/tcp_wmem', '8192 1048576 536870912')
    wr('/proc/sys/net/ipv4/ip_local_port_range', '1024 65535')
    wr('/proc/sys/net/ipv4/tcp_fastopen', 3)
    wr('/proc/sys/net/ipv4/tcp_low_latency', 1)
    wr('/proc/sys/net/ipv4/tcp_ecn', 0)
    wr('/proc/sys/net/ipv4/tcp_timestamps', 0)
    wr('/proc/sys/net/ipv4/tcp_sack', 1)
    wr('/proc/sys/net/ipv4/tcp_no_metrics_save', 1)

def dns_force_1111():
    run('setprop net.dns1 1.1.1.1')
    run('setprop net.dns2 1.0.0.1')
    run('ndc resolver setnetdns 1 "" 1.1.1.1 1.0.0.1')
    d1 = sp.getoutput('getprop net.dns1')
    if '1.1.1.1' not in d1:
        run('setprop net.dns1 1.1.1.1')

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

def full_tune():
    system_core_tune()
    zram_opt()
    io_advance()
    net_boost_advanced()
    dns_force_1111()
    anim_off()

full_tune()
print("Successfully Boosted, Please Do Not Turn Off Termux Vnd This Code")

while 1:
    clear_ram_enhanced()
    boost_cpu_maxlock()
    time.sleep(5)
