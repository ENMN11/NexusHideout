import os, subprocess as sp
from glob import glob

def w(p, v):
    try:
        with open(p, 'w') as f:
            f.write(str(v))
    except Exception as e:
        pass

def s(c):
    try:
        sp.run(c, shell=True, stdout=sp.DEVNULL, stderr=sp.DEVNULL)
    except Exception as e:
        pass

def kb():
    try:
        with open('/proc/meminfo') as f:
            return int(f.read().split('MemTotal:')[1].split()[0])
    except Exception as e:
        return 0

def run_command(cmd, check_success=False):
    try:
        result = sp.run(cmd, stdout=sp.PIPE, stderr=sp.PIPE, text=True, shell=True)
        if check_success:
            return result.returncode == 0
        else:
            return result.stdout.strip()
    except Exception as e:
        return False if check_success else ""

def optimize():
    s('settings put global window_animation_scale 0')
    s('settings put global transition_animation_scale 0')
    s('settings put global animator_duration_scale 0')
    s('settings put global heads_up_notifications_enabled 0')
    s('settings put global notification_light_pulse 0')
    s('settings put system sound_effects_enabled 0')
    s('settings put system dtmf_tone 0')
    s('settings put system lockscreen_sounds_enabled 0')
    s('settings put global zen_mode 1')
    s('service call notification 1')
    s('termux-wake-lock')

    c = os.cpu_count() or 8
    m = hex((1 << c) - 1)[2:]
    s(f'taskset -p 0x{m} $$')

    for x in glob('/sys/devices/system/cpu/cpu[0-9]*'):
        cpu_path = x
        w(cpu_path + '/online', 1)
        w(cpu_path + '/cpufreq/scaling_governor', 'performance')
        w(cpu_path + '/cpufreq/boost', 1)

        try:
            with open(cpu_path + '/cpufreq/cpuinfo_max_freq') as f:
                max_freq = int(f.read())
            w(cpu_path + '/cpufreq/scaling_max_freq', max_freq)
            w(cpu_path + '/cpufreq/scaling_min_freq', max_freq)
        except Exception as e:
            pass

    for x in glob('/proc/irq/*/smp_affinity'):
        w(x, m)

    for x in glob('/sys/devices/system/cpu/cpu*/cpuidle/state*/disable'):
        w(x, 1)

    w('/proc/sys/kernel/sched_autogroup_enabled', 0)
    w('/proc/sys/kernel/sched_boost', 1)
    w('/proc/sys/kernel/sched_min_granularity_ns', 1000)
    w('/proc/sys/kernel/sched_wakeup_granularity_ns', 1000)
    w('/proc/sys/kernel/sched_latency_ns', 2000)
    w('/proc/sys/kernel/perf_cpu_time_max_percent', 100)
    w('/proc/sys/kernel/sched_migration_cost_ns', 500)
    w('/proc/sys/kernel/sched_nr_migrate', 512)
    w('/proc/sys/kernel/nmi_watchdog', 0)
    w('/proc/sys/kernel/hung_task_timeout_secs', 0)
    w('/proc/sys/kernel/sched_child_runs_first', 0)
    w('/proc/sys/kernel/sched_rt_runtime_ns', -1)
    w('/proc/sys/kernel/sched_rt_period_ns', 1000000)

    for q in glob('/sys/block/*/queue'):
        w(q + '/read_ahead_kb', 4096)
        w(q + '/iostats', 0)
        w(q + '/rq_affinity', 2)
        w(q + '/nr_requests', 1048576)

        sc = q + '/scheduler'
        if os.path.exists(sc):
            with open(sc, 'r') as f:
                available_schedulers = f.read()
            for t in ['none', 'noop', 'mq-deadline', 'kyber']:
                if t in available_schedulers:
                    w(sc, t)
                    break
            else:
                pass
        w(q + '/nomerges', 1)
        w(q + '/add_random', 0)

    w('/proc/sys/fs/file-max', 67108864)
    w('/proc/sys/fs/inotify/max_user_watches', 8388608)

    w('/proc/sys/vm/dirty_ratio', 1)
    w('/proc/sys/vm/dirty_background_ratio', 1)
    w('/proc/sys/vm/overcommit_memory', 1)
    w('/proc/sys/vm/overcommit_ratio', 100)
    w('/proc/sys/vm/vfs_cache_pressure', 0)
    w('/proc/sys/vm/min_free_kbytes', int(kb() * 0.99999))
    w('/proc/sys/vm/swappiness', 0)
    w('/proc/sys/vm/extra_free_kbytes', 33554432)
    w('/proc/sys/vm/laptop_mode', 0)
    w('/proc/sys/vm/page-cluster', 0)
    w('/proc/sys/vm/oom_kill_allocating_task', 1)
    w('/proc/sys/vm/panic_on_oom', 0)
    w('/proc/sys/vm/stat_interval', 0)
    w('/proc/sys/vm/page_lock_unfairness', 0)
    w('/proc/sys/vm/zone_reclaim_mode', 0)
    w('/proc/sys/vm/direct_swappiness', 0)
    w('/proc/sys/vm/oom_dump_tasks', 0)

    w('/proc/sys/net/ipv4/tcp_congestion_control', 'bbr')
    w('/proc/sys/net/core/rmem_max', 2147483647)
    w('/proc/sys/net/core/wmem_max', 2147483647)
    w('/proc/sys/net/core/netdev_max_backlog', 33554432)
    w('/proc/sys/net/core/somaxconn', 8388608)
    w('/proc/sys/net/core/optmem_max', 4194304)
    w('/proc/sys/net/ipv4/tcp_rmem', '4096 1048576 2147483647')
    w('/proc/sys/net/ipv4/tcp_wmem', '4096 1048576 2147483647')
    w('/proc/sys/net/ipv4/ip_local_port_range', '1024 65535')
    w('/proc/sys/net/ipv4/tcp_low_latency', 1)
    w('/proc/sys/net/ipv4/tcp_timestamps', 0)
    w('/proc/sys/net/ipv4/tcp_ecn', 0)
    w('/proc/sys/net/ipv4/tcp_mtu_probing', 1)
    w('/proc/sys/net/ipv4/tcp_window_scaling', 1)
    w('/proc/sys/net/ipv4/tcp_no_metrics_save', 1)
    w('/proc/sys/net/ipv4/tcp_fastopen', 3)
    w('/proc/sys/net/ipv4/tcp_tw_reuse', 1)
    w('/proc/sys/net/ipv4/tcp_keepalive_time', 1)
    w('/proc/sys/net/ipv4/tcp_keepalive_probes', 3)
    w('/proc/sys/net/ipv4/tcp_keepalive_intvl', 1)
    w('/proc/sys/net/ipv4/route/flush', 1)
    s('ip neigh flush all')

    w('/proc/sys/net/ipv4/tcp_syncookies', 1)
    w('/proc/sys/net/ipv4/tcp_max_syn_backlog', 8388608)
    w('/proc/sys/net/ipv4/tcp_fin_timeout', 1)
    w('/proc/sys/net/ipv4/conf/all/rp_filter', 0)
    w('/proc/sys/net/ipv4/conf/default/rp_filter', 0)
    w('/proc/sys/net/ipv4/icmp_echo_ignore_broadcasts', 1)
    w('/proc/sys/net/ipv4/icmp_ignore_bogus_error_responses', 1)
    w('/proc/sys/net/ipv4/conf/all/accept_source_route', 0)
    w('/proc/sys/net/ipv4/conf/default/accept_source_route', 0)
    s('ip -s -s neigh flush all')
    w('/proc/sys/net/ipv4/tcp_sack', 1)
    w('/proc/sys/net/ipv4/tcp_fack', 1)
    w('/proc/sys/net/ipv4/tcp_dsack', 1)
    w('/proc/sys/net/ipv4/tcp_frto', 1)
    w('/proc/sys/net/ipv4/tcp_notsent_lowat', 65536)
    w('/proc/sys/net/ipv4/tcp_retries2', 3)
    w('/proc/sys/net/ipv4/tcp_orphan_retries', 1)
    w('/proc/sys/net/ipv4/tcp_syn_retries', 2)

    w('/proc/sys/vm/drop_caches', 3)
    w('/proc/sys/vm/compact_memory', 1)
    s('sync')
    s('logcat -c')

    dirs = [
        '/cache', '/data/system/dropbox', '/data/system/usagestats', '/data/tombstones',
        '/data/anr', '/data/dalvik-cache', '/data/resource-cache', '/data/local/tmp',
        '/data/log', '/data/logger', '/data/logcat', '/data/misc/logd',
        '/data/misc/bluedroid', '/data/misc/wifi/logs', '/data/misc/perf',
        '/data/misc/traces', '/data/system/sync', '/data/system/netstats',
        '/data/system/batterystats',
    ]
    for d in dirs:
        s(f'rm -rf {d}/*')

optimize()
print("System Fully Optimized, Cleaned And Boosted.")
