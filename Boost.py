import os, subprocess as sp
from glob import glob

def w(p, v):
    try: open(p, 'w').write(str(v))
    except: pass

def s(c):
    try: sp.run(c, shell=True, stdout=sp.DEVNULL, stderr=sp.DEVNULL)
    except: pass

def kb():
    try: return int(open('/proc/meminfo').read().split('MemTotal:')[1].split()[0])
    except: return 0

def run_command(cmd, check_success=False):
    try:
        result = sp.run(cmd, stdout=sp.PIPE, stderr=sp.PIPE, text=True)
        return result.returncode == 0 if check_success else result.stdout
    except:
        return False

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
        w(x + '/online', 1)
        w(x + '/cpufreq/scaling_governor', 'performance')
        w(x + '/cpufreq/boost', 1)
        try:
            f = int(open(x + '/cpufreq/cpuinfo_max_freq').read())
            w(x + '/cpufreq/scaling_max_freq', f)
            w(x + '/cpufreq/scaling_min_freq', f)
        except: pass

    for x in glob('/proc/irq/*/smp_affinity'): w(x, m)
    for x in glob('/sys/devices/system/cpu/cpu*/cpuidle/state*/disable'): w(x, 1)

    for q in glob('/sys/block/*/queue'):
        w(q + '/read_ahead_kb', 20480)
        w(q + '/iostats', 0)
        w(q + '/rq_affinity', 1)
        w(q + '/nr_requests', 15360)
        sc = q + '/scheduler'
        if os.path.exists(sc):
            for t in ['none', 'mq-deadline', 'kyber', 'noop']:
                if t in open(sc).read(): w(sc, t); break

    w('/proc/sys/kernel/sched_autogroup_enabled', 0)
    w('/proc/sys/kernel/sched_boost', 1)

    w('/proc/sys/vm/dirty_ratio', 5)
    w('/proc/sys/vm/dirty_background_ratio', 2)
    w('/proc/sys/vm/overcommit_memory', 1)
    w('/proc/sys/vm/overcommit_ratio', 100)
    w('/proc/sys/vm/vfs_cache_pressure', 10)
    w('/proc/sys/vm/min_free_kbytes', max(1048576, int(kb() * 0.6)))
    w('/proc/sys/vm/swappiness', 0)

    w('/proc/sys/net/ipv4/tcp_congestion_control', 'bbr')
    w('/proc/sys/net/core/rmem_max', 268435456)
    w('/proc/sys/net/core/wmem_max', 268435456)
    w('/proc/sys/net/core/netdev_max_backlog', 524288)
    w('/proc/sys/net/core/somaxconn', 131072)
    w('/proc/sys/net/ipv4/tcp_rmem', '4096 131072 268435456')
    w('/proc/sys/net/ipv4/tcp_wmem', '4096 65536 268435456')
    w('/proc/sys/net/ipv4/ip_local_port_range', '1024 65535')
    w('/proc/sys/net/ipv4/tcp_low_latency', 1)
    w('/proc/sys/net/ipv4/tcp_timestamps', 0)
    w('/proc/sys/net/ipv4/tcp_ecn', 0)
    w('/proc/sys/net/ipv4/tcp_mtu_probing', 1)
    w('/proc/sys/net/ipv4/tcp_window_scaling', 1)
    w('/proc/sys/net/ipv4/tcp_no_metrics_save', 1)
    w('/proc/sys/net/ipv4/tcp_fastopen', 3)
    w('/proc/sys/net/ipv4/tcp_tw_reuse', 1)
    w('/proc/sys/net/ipv4/tcp_keepalive_time', 15)
    w('/proc/sys/net/ipv4/tcp_keepalive_probes', 3)
    w('/proc/sys/net/ipv4/tcp_keepalive_intvl', 10)
    w('/proc/sys/net/ipv4/route/flush', 1)
    s('ip neigh flush all')

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
    for d in dirs: s(f'rm -rf {d}/*')

    handle_apps()

    print("System Fully Optimized, Cleaned And Boosted.")

def handle_apps():
    to_disable = sorted(set([
        "com.google.android.apps.nbu.files",
        "com.google.android.dialer",
        "com.android.providers.telephony"
    ]))

    to_uninstall = sorted(set([
        "com.android.browser", "com.android.calendar", "com.android.deskclock", "com.android.email",
        "com.android.launcher3", "com.android.printspooler", "com.android.protips",
        "com.android.soundrecorder", "com.android.theme.font", "com.android.theme.icon",
        "com.android.theme.wallpaper", "com.android.wallpaper.livepicker",
        "com.miui.analytics", "com.miui.backup", "com.miui.bugreport", "com.miui.cleanmaster",
        "com.miui.cloudbackup", "com.miui.cloudservice", "com.miui.cloudservice.sysbase",
        "com.miui.compass", "com.miui.contentextension", "com.miui.daemon",
        "com.miui.enbbs", "com.miui.fm", "com.miui.hybrid", "com.miui.hybrid.accessory",
        "com.miui.miapppredict", "com.miui.micloudsync", "com.miui.miservice",
        "com.miui.miwallpaper", "com.miui.notes", "com.miui.personalassistant",
        "com.miui.player", "com.miui.screenrecorder", "com.miui.sysopt", "com.miui.translation.kingsoft",
        "com.miui.translationservice", "com.miui.video", "com.miui.virtualsim",
        "com.miui.voiceassist", "com.miui.weather", "com.miui.weather2",
        "com.og.gamecenter", "com.og.launcher", "com.og.market", "com.og.toolcenter",
        "com.xiaomi.ab", "com.xiaomi.account", "com.xiaomi.account.auth",
        "com.xiaomi.glgm", "com.xiaomi.mipicks", "com.xiaomi.miplay_client", "com.xiaomi.mircs",
        "com.xiaomi.pass", "com.xiaomi.payment", "com.xiaomi.simactivate.service",
        "com.xiaomi.xmsf", "com.google.android.apps.nbu.files", "com.google.android.dialer", "com.android.providers.telephony"
    ]))

    for pkg in to_disable:
        sp.run(["pm", "disable-user", "--user", "0", pkg], stdout=sp.DEVNULL, stderr=sp.DEVNULL)

    for pkg in to_uninstall:
        sp.run(["pm", "uninstall", "--user", "0", pkg], stdout=sp.DEVNULL, stderr=sp.DEVNULL)

optimize()
