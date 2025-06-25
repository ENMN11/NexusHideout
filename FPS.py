#!/usr/bin/env python3

import os
import subprocess
import time
import colorama
from glob import glob
import math

colorama.init(autoreset=True)

if os.geteuid() != 0:
    print(colorama.Fore.LIGHTRED_EX + "⚖️ Root Required!")
    exit(1)

def safe_write_sysfs(path, value):
    try:
        if os.path.exists(path):
            with open(path, 'w') as f:
                f.write(str(value))
            return True
        return False
    except:
        return False

def run_shell_command(cmd, timeout=5):
    try:
        subprocess.run(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, timeout=timeout)
        return True
    except:
        return False

def clear_ram():
    try:
        run_shell_command("sync")
        safe_write_sysfs("/proc/sys/vm/drop_caches", 3)
        safe_write_sysfs("/proc/sys/vm/compact_memory", 1)
        safe_write_sysfs("/proc/sys/vm/reap_mem_on_sigkill", 1)
        safe_write_sysfs("/proc/sys/vm/slab_reclaim_account", 1)
        safe_write_sysfs("/proc/sys/vm/vfs_cache_pressure", 200)
        safe_write_sysfs("/proc/sys/vm/min_free_kbytes", int(1048576 * 1.40))  
        safe_write_sysfs("/proc/sys/vm/zone_reclaim_mode", 1)
        for slab in glob("/sys/kernel/slab/*/reclaim_account"):
            safe_write_sysfs(slab, 1)
        run_shell_command("sync && echo 1 > /proc/sys/fs/inode-nr")
        return True
    except:
        return False

def clear_cpu_queue():
    try:
        for cpu in glob("/proc/irq/*/smp_affinity"):
            safe_write_sysfs(cpu, "f")
        for cpu in glob("/sys/devices/system/cpu/cpu[0-9]*/schedstat"):
            safe_write_sysfs(os.path.join(cpu, "runqueue"), 0)
        safe_write_sysfs("/proc/sys/kernel/sched_migration_cost_ns", 0)
        safe_write_sysfs("/proc/sys/kernel/sched_cfs_bandwidth_slice_us", 100)
        safe_write_sysfs("/proc/sys/kernel/sched_min_granularity_ns", 4000)
        safe_write_sysfs("/proc/sys/kernel/sched_wakeup_granularity_ns", 2000)
        run_shell_command("echo 0 > /proc/sys/kernel/softlockup_panic")
        run_shell_command("taskset -p 0xFF $$")
        for cpu in glob("/sys/devices/system/cpu/cpu[0-9]*"):
            safe_write_sysfs(os.path.join(cpu, "cpufreq/scaling_governor"), "performance")
            try:
                with open(os.path.join(cpu, "cpufreq/cpuinfo_max_freq"), 'r') as f:
                    maxf = int(f.read().strip())
                with open(os.path.join(cpu, "cpufreq/cpuinfo_min_freq"), 'r') as f:
                    minf = int(f.read().strip())
                if maxf and minf:
                    safe_write_sysfs(os.path.join(cpu, "cpufreq/scaling_max_freq"), maxf)
                    scaled_min = min(int(minf * 1.40), maxf)
                    safe_write_sysfs(os.path.join(cpu, "cpufreq/scaling_min_freq"), scaled_min)
            except:
                pass
        return True
    except:
        return False

def clear_gpu_buffer():
    try:
        if os.path.exists("/sys/class/kgsl/kgsl-3d0"):
            safe_write_sysfs("/sys/class/kgsl/kgsl-3d0/flush_cache", 1)
            safe_write_sysfs("/sys/class/kgsl/kgsl-3d0/flush_shader_cache", 1)
            safe_write_sysfs("/sys/class/kgsl/kgsl-3d0/reset", 1)
            safe_write_sysfs("/sys/class/kgsl/kgsl-3d0/flush_texture_cache", 1)
            safe_write_sysfs("/sys/class/kgsl/kgsl-3d0/flush_compute_cache", 1)
            safe_write_sysfs("/sys/class/kgsl/kgsl-3d0/mem_reset", 1)
            safe_write_sysfs("/sys/class/kgsl/kgsl-3d0/devfreq/governor", "performance")
            safe_write_sysfs("/sys/class/kgsl/kgsl-3d0/devfreq/polling_interval", 0)
            safe_write_sysfs("/sys/class/kgsl/kgsl-3d0/force_clk_on", 1)
            safe_write_sysfs("/sys/class/kgsl/kgsl-3d0/force_bus_on", 1)
            safe_write_sysfs("/sys/class/kgsl/kgsl-3d0/force_rail_on", 1)
            try:
                with open("/sys/class/kgsl/kgsl-3d0/devfreq/max_freq", 'r') as f:
                    maxgf = int(f.read().strip())
                with open("/sys/class/kgsl/kgsl-3d0/devfreq/min_freq", 'r') as f:
                    mingf = int(f.read().strip())
                if maxgf and mingf:
                    safe_write_sysfs("/sys/class/kgsl/kgsl-3d0/devfreq/max_freq", maxgf)
                    scaled_min = min(int(mingf * 1.40), maxgf)
                    safe_write_sysfs("/sys/class/kgsl/kgsl-3d0/devfreq/min_freq", scaled_min)
            except:
                pass
        return True
    except:
        return False

def optimize_system():
    try:
        run_shell_command("sync")
        safe_write_sysfs("/proc/sys/vm/swappiness", 5)
        safe_write_sysfs("/proc/sys/vm/min_free_kbytes", int(1048576 * 1.40))
        safe_write_sysfs("/proc/sys/vm/oom_kill_allocating_task", 0)
        safe_write_sysfs("/proc/sys/vm/overcommit_memory", 1)
        safe_write_sysfs("/proc/sys/vm/overcommit_ratio", 98)
        for ddr in glob("/sys/class/devfreq/*ddr*"):
            safe_write_sysfs(os.path.join(ddr, "governor"), "performance")
            try:
                with open(os.path.join(ddr, "max_freq"), 'r') as f:
                    maxf = int(f.read().strip())
                with open(os.path.join(ddr, "min_freq"), 'r') as f:
                    minf = int(f.read().strip())
                if maxf and minf:
                    safe_write_sysfs(os.path.join(ddr, "max_freq"), maxf)
                    scaled_min = min(int(minf * 1.40), maxf)
                    safe_write_sysfs(os.path.join(ddr, "min_freq"), scaled_min)
            except:
                pass
        safe_write_sysfs("/proc/sys/net/core/rmem_max", 52428800)
        safe_write_sysfs("/proc/sys/net/core/wmem_max", 52428800)
        safe_write_sysfs("/proc/sys/net/core/netdev_max_backlog", 262144)
        safe_write_sysfs("/proc/sys/net/core/somaxconn", 1048576)
        safe_write_sysfs("/proc/sys/net/ipv4/tcp_rmem", "16384 1048576 52428800")
        safe_write_sysfs("/proc/sys/net/ipv4/tcp_wmem", "16384 1048576 52428800")
        safe_write_sysfs("/proc/sys/net/ipv4/tcp_window_scaling", 1)
        safe_write_sysfs("/proc/sys/net/ipv4/tcp_fastopen", 3)
        safe_write_sysfs("/proc/sys/net/ipv4/tcp_low_latency", 1)
        safe_write_sysfs("/proc/sys/net/ipv4/tcp_congestion_control", "bbr2")
        safe_write_sysfs("/proc/sys/net/core/default_qdisc", "fq_pie")
        for iface in glob("/sys/class/net/*"):
            iface_name = os.path.basename(iface)
            run_shell_command(f"ethtool -K {iface_name} tso on gso on gro on ufo on")
            safe_write_sysfs(f"/sys/class/net/{iface_name}/tx_queue_len", 262144)
            safe_write_sysfs(f"/sys/class/net/{iface_name}/napi_defer_hard_irqs", 0)
            safe_write_sysfs(f"/sys/class/net/{iface_name}/gro_flush_timeout", 4)
        safe_write_sysfs("/proc/sys/kernel/sched_boost", 15)
        safe_write_sysfs("/proc/sys/kernel/sched_latency_ns", 8000)
        safe_write_sysfs("/proc/sys/kernel/sched_migration_cost_ns", 0)
        safe_write_sysfs("/proc/sys/kernel/sched_cfs_bandwidth_slice_us", 100)
        safe_write_sysfs("/proc/sys/kernel/threads-max", 16777216)
        safe_write_sysfs("/sys/module/cpu_boost/parameters/input_boost_enabled", 1)
        safe_write_sysfs("/sys/module/cpu_boost/parameters/input_boost_freq", 99999999)
        safe_write_sysfs("/sys/kernel/sched_tune/boost", 250)
        run_shell_command("settings put global window_animation_scale 0")
        run_shell_command("settings put global transition_animation_scale 0")
        run_shell_command("settings put global animator_duration_scale 0")
        run_shell_command("settings put system peak_refresh_rate 165")
        run_shell_command("settings put system pointer_speed 10")
        for tz in glob("/sys/devices/virtual/thermal/thermal_zone*"):
            safe_write_sysfs(os.path.join(tz, "mode"), "enabled")
            safe_write_sysfs(os.path.join(tz, "trip_point_0_temp"), 125000)
            safe_write_sysfs(os.path.join(tz, "trip_point_1_temp"), 115000)
        for policy in glob("/sys/devices/virtual/thermal/thermal_policy*"):
            viết_sysfs(os.path.join(policy, "mode"), "performance")
        for block in glob("/sys/block/*/queue/scheduler"):
            safe_write_sysfs(block, "bfq")
        for block in glob("/sys/block/*/queue/read_ahead_kb"):
            safe_write_sysfs(block, 65536)
        for block in glob("/sys/block/*/queue/iostats"):
            safe_write_sysfs(block, 0)
        if os.path.exists("/sys/block/zram0"):
            run_shell_command("swapoff /dev/block/zram0")
            safe_write_sysfs("/sys/block/zram0/reset", 1)
            safe_write_sysfs("/sys/block/zram0/comp_algorithm", "zstd")
            try:
                with open("/proc/meminfo", 'r') as f:
                    for line in f:
                        if "MemTotal" in line:
                            total = int(line.split()[1]) * 1024 * 2.0 
                            break
                safe_write_sysfs("/sys/block/zram0/disksize", int(total))
                run_shell_command("mkswap /dev/block/zram0")
                run_shell_command("swapon /dev/block/zram0 -p 262144")
            except:
                pass
        clear_ram()
        clear_cpu_queue()
        clear_gpu_buffer()
        return True
    except:
        return False

printed_done = False

while True:
    if optimize_system() and not printed_done:
        print(colorama.Fore.GREEN + "🎲 System Optimized Successfully 🐃")
        printed_done = True
