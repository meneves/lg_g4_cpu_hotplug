#!/system/bin/sh

CPUS_ONLINE=1
CPU0_MIN_FREQ=`cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq`

while true; do
  # get cpu0 freq
  CPU0_CUR_FREQ=`cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq`

  if [ $CPU0_CUR_FREQ -gt $CPU0_MIN_FREQ -a $CPUS_ONLINE = 1 ];
  then
    sleep 2
    continue;
  fi

  # cpu0 always on
  if [ $CPU0_CUR_FREQ = $CPU0_MIN_FREQ -a $CPUS_ONLINE = 1 ];
  then
    #echo "cores down"
    echo 0 > /sys/devices/system/cpu/cpu1/online
    echo 0 > /sys/devices/system/cpu/cpu2/online
    echo 0 > /sys/devices/system/cpu/cpu3/online
    echo 0 > /sys/devices/system/cpu/cpu4/online
    echo 0 > /sys/devices/system/cpu/cpu5/online
    CPUS_ONLINE=0
    usleep 100000
    continue;
  fi

  if [ $CPU0_CUR_FREQ -gt $CPU0_MIN_FREQ -a $CPUS_ONLINE = 0 ];
  then
    #echo "cores up"
    echo 1 > /sys/devices/system/cpu/cpu1/online
    echo 1 > /sys/devices/system/cpu/cpu2/online
    echo 1 > /sys/devices/system/cpu/cpu3/online
    echo 1 > /sys/devices/system/cpu/cpu4/online
    echo 1 > /sys/devices/system/cpu/cpu5/online
    CPUS_ONLINE=1
    sleep 2
    continue;
  fi

  # Wait before checking again.
  usleep 500000
done
