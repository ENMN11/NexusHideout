#!/usr/bin/env python3

import os
import subprocess
import time
import colorama
from glob import glob
import math

colorama.init(autoreset=True)

if os.geteuid() != 0:
    print(colorama.Fore.LIGHTRED_EX + "⚖️ Root Permission Required! 🚀")
    exit(1)

def safe_write_sysfs(path, value):
    try:
        if os.path.exists(path):
            with open(path, 'w') as f:
                f.write(str(value))
            return True
        return False
    except IOError as e:
        return False
    except Exception as e:
        return False

def run_shell_command(cmd, timeout=7):
    try:
        result = subprocess.run(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, timeout=timeout)
        if result.returncode != 0:
            pass
        return result.returncode == 0
    except subprocess.TimeoutExpired:
        return False
    except Exception as e:
        return False

def get_total_memory_kb():
    try:
        with open("/proc/meminfo", 'r') as f:
            for line in f:
                if "MemTotal" in line:
                    return int(line.split()[1])
    except Exception:
        return 0
    return 0

def clear_ram():
    total_mem_kb = get_total_memory_kb()

    min_free_target_kb = min(int(total_mem_kb * 0.10), 524288) if total_mem_kb > 0 else 65536

    try:
        run_shell_command("sync")
        safe_write_sysfs("/proc/sys/vm/drop_caches", 3)
        safe_write_sysfs("/proc/sys/vm/compact_memory", 1)
        safe_write_sysfs("/proc/sys/vm/reap_mem_on_sigkill", 1)
        safe_write_sysfs("/proc/sys/vm/slab_reclaim_account", 1)
        safe_write_sysfs("/proc/sys/vm/vfs_cache_pressure", 300)
        safe_write_sysfs("/proc/sys/vm/min_free_kbytes", min_free_target_kb)
        safe_write_sysfs("/proc/sys/vm/zone_reclaim_mode", 0)

        for slab in glob("/sys/kernel/slab/*/reclaim_account"):
            safe_write_sysfs(slab, 1)

        run_shell_command("sync && echo 1 > /proc/sys/fs/inode-nr")

        safe_write_sysfs("/proc/sys/vm/watermark_scale_factor", 500)
        safe_write_sysfs("/proc/sys/vm/page_cluster", 0)
        safe_write_sysfs("/proc/sys/vm/extra_free_kbytes", int(min_free_target_kb * 0.5))

        thp_path = "/sys/kernel/mm/transparent_hugepage/enabled"
        if os.path.exists(thp_path):
            with open(thp_path, 'r') as f:
                current_thp = f.read().strip()
            if "always" in current_thp:
                safe_write_sysfs(thp_path, "madvise")
            elif "madvise" in current_thp:
                pass
            else:
                pass
        return True
    except Exception as e:
        return False

def clear_cpu_queue():
    try:
        num_cpus = os.cpu_count() or 1
        affinity_mask = (1 << num_cpus) - 1
        affinity_hex = hex(affinity_mask)[2:]

        for irq_smp_affinity in glob("/proc/irq/*/smp_affinity"):
            safe_write_sysfs(irq_smp_affinity, affinity_hex)

        safe_write_sysfs("/proc/sys/kernel/sched_migration_cost_ns", 0)
        safe_write_sysfs("/proc/sys/kernel/sched_cfs_bandwidth_slice_us", 100)
        safe_write_sysfs("/proc/sys/kernel/sched_min_granularity_ns", 1000000)
        safe_write_sysfs("/proc/sys/kernel/sched_wakeup_granularity_ns", 2000000)
        safe_write_sysfs("/proc/sys/kernel/softlockup_panic", 0)
        run_shell_command(f"taskset -p 0x{affinity_hex} $$")

        for cpu_dir in glob("/sys/devices/system/cpu/cpu[0-9]*"):
            cpu_online_path = os.path.join(cpu_dir, "online")
            if os.path.exists(cpu_online_path):
                with open(cpu_online_path, 'r') as f:
                    if f.read().strip() == '0':
                        safe_write_sysfs(cpu_online_path, 1)

            governor_path = os.path.join(cpu_dir, "cpufreq/scaling_governor")
            if safe_write_sysfs(governor_path, "performance"):
                max_freq_path = os.path.join(cpu_dir, "cpufreq/cpuinfo_max_freq")
                scaling_max_path = os.path.join(cpu_dir, "cpufreq/scaling_max_freq")
                scaling_min_path = os.path.join(cpu_dir, "cpufreq/scaling_min_freq")

                try:
                    with open(max_freq_path, 'r') as f:
                        maxf = int(f.read().strip())

                    if maxf:
                        safe_write_sysfs(scaling_max_path, maxf)
                        safe_write_sysfs(scaling_min_path, maxf)
                except Exception as e:
                    pass
            else:
                pass

        safe_write_sysfs("/proc/sys/kernel/sched_autogroup_enabled", 0)
        safe_write_sysfs("/proc/sys/kernel/sched_child_runs_first", 0)
        safe_write_sysfs("/proc/sys/kernel/sched_rt_runtime_us", 990000)
        safe_write_sysfs("/proc/sys/kernel/sched_rt_period_us", 1000000)
        safe_write_sysfs("/proc/sys/kernel/numa_balancing", 0)
        safe_write_sysfs("/proc/sys/kernel/perf_event_paranoid", -1)
        safe_write_sysfs("/proc/sys/kernel/watchdog_thresh", 0)
        safe_write_sysfs("/proc/sys/kernel/hung_task_timeout_secs", 60)

        return True
    except Exception as e:
        return False

def clear_gpu_buffer():
    try:
        kgsl_gpu_path = "/sys/class/kgsl/kgsl-3d0"
        if os.path.exists(kgsl_gpu_path):
            safe_write_sysfs(os.path.join(kgsl_gpu_path, "flush_cache"), 1)
            safe_write_sysfs(os.path.join(kgsl_gpu_path, "flush_shader_cache"), 1)
            safe_write_sysfs(os.path.join(kgsl_gpu_path, "reset"), 1)
            safe_write_sysfs(os.path.join(kgsl_gpu_path, "flush_texture_cache"), 1)
            safe_write_sysfs(os.path.join(kgsl_gpu_path, "flush_compute_cache"), 1)
            safe_write_sysfs(os.path.join(kgsl_gpu_path, "mem_reset"), 1)

            safe_write_sysfs(os.path.join(kgsl_gpu_path, "devfreq/governor"), "performance")
            safe_write_sysfs(os.path.join(kgsl_gpu_path, "devfreq/polling_interval"), 0)
            safe_write_sysfs(os.path.join(kgsl_gpu_path, "force_clk_on"), 1)
            safe_write_sysfs(os.path.join(kgsl_gpu_path, "force_bus_on"), 1)
            safe_write_sysfs(os.path.join(kgsl_gpu_path, "force_rail_on"), 1)

            max_gf_path = os.path.join(kgsl_gpu_path, "devfreq/max_freq")

            try:
                with open(max_gf_path, 'r') as f:
                    maxgf = int(f.read().strip())

                if maxgf:
                    safe_write_sysfs(max_gf_path, maxgf)
                    safe_write_sysfs(os.path.join(kgsl_gpu_path, "devfreq/min_freq"), maxgf)
            except Exception as e:
                pass
        else:
            pass

        for nv_perf_mode in glob("/sys/class/drm/card*/device/power_performance_mode"):
            safe_write_sysfs(nv_perf_mode, "P0")

        for nv_cool_perf_level in glob("/proc/driver/nvidia/gpus/*/power_management/perf_level"):
            safe_write_sysfs(nv_cool_perf_level, "max")

        for amd_power_profile in glob("/sys/class/drm/card*/device/pp_power_profile_mode"):
            try:
                with open(amd_power_profile, 'r') as f:
                    modes = [line.split(":")[0].strip() for line in f if "performance" in line.lower()]
                    if modes:
                        safe_write_sysfs(amd_power_profile, modes[0])
            except Exception as e:
                pass

        for amd_dpm_level in glob("/sys/class/drm/card*/device/power_dpm_force_performance_level"):
            safe_write_sysfs(amd_dpm_level, "high")

        for i915_perf_path in glob("/sys/class/drm/card*/power/rc6_enable"):
            safe_write_sysfs(i915_perf_path, 1)
        for i915_boost_path in glob("/sys/class/drm/card*/gt_min_freq_mhz"):
            if os.path.exists(i915_boost_path):
                try:
                    with open(os.path.join(os.path.dirname(i915_boost_path), "gt_max_freq_mhz"), 'r') as f:
                        max_i915_freq = int(f.read().strip())
                    safe_write_sysfs(i915_boost_path, max_i915_freq)
                except Exception as e:
                    pass

        return True
    except Exception as e:
        return False

def optimize_system():
    try:
        run_shell_command("sync")

        safe_write_sysfs("/proc/sys/vm/swappiness", 0) # Set swappiness to 0 for almost no swapping
        safe_write_sysfs("/proc/sys/vm/oom_kill_allocating_task", 0)
        safe_write_sysfs("/proc/sys/vm/overcommit_memory", 1)
        safe_write_sysfs("/proc/sys/vm/overcommit_ratio", 100)
        safe_write_sysfs("/proc/sys/vm/dirty_ratio", 3)
        safe_write_sysfs("/proc/sys/vm/dirty_background_ratio", 1)
        safe_write_sysfs("/proc/sys/vm/laptop_mode", 0)

        for ddr_dir in glob("/sys/class/devfreq/*ddr*"):
            governor_path = os.path.join(ddr_dir, "governor")
            if safe_write_sysfs(governor_path, "performance"):
                max_freq_path = os.path.join(ddr_dir, "max_freq")

                try:
                    with open(max_freq_path, 'r') as f:
                        maxf = int(f.read().strip())

                    if maxf:
                        safe_write_sysfs(max_freq_path, maxf)
                        safe_write_sysfs(os.path.join(ddr_dir, "min_freq"), maxf)
                except Exception as e:
                    pass
            else:
                pass

        safe_write_sysfs("/proc/sys/net/core/rmem_max", 268435456) # 256MB
        safe_write_sysfs("/proc/sys/net/core/wmem_max", 268435456) # 256MB
        safe_write_sysfs("/proc/sys/net/core/netdev_max_backlog", 2097152) # Increased significantly
        safe_write_sysfs("/proc/sys/net/core/somaxconn", 8388608) # Increased significantly
        safe_write_sysfs("/proc/sys/net/ipv4/tcp_rmem", "4096 33554432 268435456")
        safe_write_sysfs("/proc/sys/net/ipv4/tcp_wmem", "4096 33554432 268435456")
        safe_write_sysfs("/proc/sys/net/ipv4/tcp_window_scaling", 1)
        safe_write_sysfs("/proc/sys/net/ipv4/tcp_fastopen", 3)
        safe_write_sysfs("/proc/sys/net/ipv4/tcp_low_latency", 1)
        safe_write_sysfs("/proc/sys/net/ipv4/tcp_congestion_control", "bbr")
        safe_write_sysfs("/proc/sys/net/core/default_qdisc", "fq")
        safe_write_sysfs("/proc/sys/net/ipv4/tcp_timestamps", 0)
        safe_write_sysfs("/proc/sys/net/ipv4/tcp_sack", 1)
        safe_write_sysfs("/proc/sys/net/ipv4/tcp_ecn", 0)
        safe_write_sysfs("/proc/sys/net/ipv4/tcp_tw_reuse", 1)
        safe_write_sysfs("/proc/sys/net/ipv4/tcp_fin_timeout", 15)
        safe_write_sysfs("/proc/sys/net/ipv4/tcp_no_metrics_save", 1)
        safe_write_sysfs("/proc/sys/net/netfilter/nf_conntrack_max", 65536 * 8)

        for iface in glob("/sys/class/net/*"):
            iface_name = os.path.basename(iface)
            if iface_name == "lo" or not os.path.exists(os.path.join(iface, "device")):
                continue
            run_shell_command(f"ethtool -K {iface_name} tso on gso on gro on ufo on lro off")
            safe_write_sysfs(f"/sys/class/net/{iface_name}/tx_queue_len", 1048576)
            safe_write_sysfs(f"/sys/class/net/{iface_name}/napi_defer_hard_irqs", 0)
            safe_write_sysfs(f"/sys/class/net/{iface_name}/gro_flush_timeout", 1)
            safe_write_sysfs(f"/sys/class/net/{iface_name}/rx_queue_size", 16384) # Doubled
            safe_write_sysfs(f"/sys/class/net/{iface_name}/tx_queue_size", 16384) # Doubled

        safe_write_sysfs("/proc/sys/net/core/netdev_budget", 1200)
        safe_write_sysfs("/proc/sys/net/core/netdev_budget_usecs", 10000)

        safe_write_sysfs("/proc/sys/kernel/sched_boost", 15)
        safe_write_sysfs("/proc/sys/kernel/sched_latency_ns", 4000000)
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
            safe_write_sysfs(os.path.join(tz, "trip_point_0_temp"), 127000)
            safe_write_sysfs(os.path.join(tz, "trip_point_1_temp"), 120000)
        for policy in glob("/sys/devices/virtual/thermal/thermal_policy*"):
            safe_write_sysfs(os.path.join(policy, "mode"), "performance")

        for block_dir in glob("/sys/block/*/queue"):
            scheduler_path = os.path.join(block_dir, "scheduler")
            read_ahead_path = os.path.join(block_dir, "read_ahead_kb")
            iostats_path = os.path.join(block_dir, "iostats")
            rq_affinity_path = os.path.join(block_dir, "rq_affinity")
            nr_requests_path = os.path.join(block_dir, "nr_requests")

            if os.path.exists(scheduler_path):
                with open(scheduler_path, 'r') as f:
                    schedulers = f.read().strip().replace('[', '').replace(']', '').split()
                if "bfq" in schedulers:
                    safe_write_sysfs(scheduler_path, "bfq")
                elif "mq-deadline" in schedulers:
                    safe_write_sysfs(scheduler_path, "mq-deadline")
                elif "noop" in schedulers:
                    safe_write_sysfs(scheduler_path, "noop")
                elif "deadline" in schedulers:
                    safe_write_sysfs(scheduler_path, "deadline")
                else:
                    pass

            safe_write_sysfs(read_ahead_path, 32) # Further reduced
            safe_write_sysfs(iostats_path, 0)
            safe_write_sysfs(rq_affinity_path, 1)
            safe_write_sysfs(nr_requests_path, 1024) # Increased

        if os.path.exists("/sys/block/zram0"):
            run_shell_command("swapoff /dev/block/zram0", timeout=10)
            safe_write_sysfs("/sys/block/zram0/reset", 1)
            safe_write_sysfs("/sys/block/zram0/comp_algorithm", "zstd")
            safe_write_sysfs("/sys/block/zram0/max_comp_streams", os.cpu_count() or 4)

            total_mem_kb = get_total_memory_kb()
            if total_mem_kb > 0:
                zram_disksize_bytes = int(total_mem_kb * 1024 * 4.0) # 4x RAM size for ZRAM
                if safe_write_sysfs("/sys/block/zram0/disksize", zram_disksize_bytes):
                    run_shell_command("mkswap /dev/block/zram0")
                    run_shell_command("swapon /dev/block/zram0 -p 32767")
                else:
                    pass
            else:
                pass
        else:
            pass

        safe_write_sysfs("/proc/sys/fs/file-max", 8388608) # Doubled
        safe_write_sysfs("/proc/sys/fs/inotify/max_user_watches", 4194304) # Doubled
        safe_write_sysfs("/proc/sys/fs/inotify/max_queued_events", 131072) # Doubled
        safe_write_sysfs("/proc/sys/fs/inotify/max_user_instances", 8192) # Doubled

        safe_write_sysfs("/proc/sys/kernel/nmi_watchdog", 0)
        safe_write_sysfs("/proc/sys/kernel/panic_on_oops", 0)
        safe_write_sysfs("/proc/sys/kernel/randomize_va_space", 2)

        clear_ram()
        clear_cpu_queue()
        clear_gpu_buffer()
        return True
    except Exception as e:
        return False

printed_done = False

while True:
    if optimize_system():
        if not printed_done:
            print(colorama.Fore.LIGHTGREEN_EX + "Android Speed ​​Up Process Completed, Please Don't Turn Off Tool And Termux!")
            printed_done = True
    else:
        printed_done = False
    time.sleep(5)
