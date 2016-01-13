#!/system/bin/sh

for GOV in interactive cafactive
do
        if [ -d /sys/devices/system/cpu/cpu0/cpufreq/$GOV ];
        then
                governor=$GOV
                echo governor=$GOV
        fi
done

timer_rate=50000
above_hispeed_delay="50000 960000:100000"
hispeed_freq="633000"
target_loads=85
min_sample_time=250000
timer_slack=250000
go_hispeed_load=100
io_is_busy=0
max_freq_hysteresis=0

for PR in 0 1 2 3
do
        echo 1 > /sys/devices/system/cpu/cpu${PR}/online

        echo $timer_rate > /sys/devices/system/cpu/cpu${PR}/cpufreq/$governor/timer_rate
        echo $above_hispeed_delay > /sys/devices/system/cpu/cpu${PR}/cpufreq/$governor/above_hispeed_delay
        echo $hispeed_freq > /sys/devices/system/cpu/cpu${PR}/cpufreq/$governor/hispeed_freq
        echo $target_loads > /sys/devices/system/cpu/cpu${PR}/cpufreq/$governor/target_loads
        echo $min_sample_time > /sys/devices/system/cpu/cpu${PR}/cpufreq/$governor/min_sample_time
        echo $timer_slack > /sys/devices/system/cpu/cpu${PR}/cpufreq/$governor/timer_slack
        echo $go_hispeed_load > /sys/devices/system/cpu/cpu${PR}/cpufreq/$governor/go_hispeed_load
        echo $io_is_busy > /sys/devices/system/cpu/cpu${PR}/cpufreq/$governor/io_is_busy
        echo $max_freq_hysteresis > /sys/devices/system/cpu/cpu${PR}/cpufreq/$governor/max_freq_hysteresis
done
