#!/system/bin/sh

echo 0 > /sys/devices/system/cpu/cpu1/online
echo 0 > /sys/devices/system/cpu/cpu2/online
echo 0 > /sys/devices/system/cpu/cpu3/online

usleep 100000

echo "50000" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
echo "50000 960000:150000" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
echo "600000" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo "110" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
echo "500000" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo "500000" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack
echo "999999" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo "0" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/io_is_busy
echo "0" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis

echo 1 > /sys/devices/system/cpu/cpu1/online
echo 1 > /sys/devices/system/cpu/cpu2/online
echo 1 > /sys/devices/system/cpu/cpu3/online