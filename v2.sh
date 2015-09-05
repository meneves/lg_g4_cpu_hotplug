#!/system/bin/sh

CPUS_ONLINE=6
CPUS_SHOULD=6
CPUS_SHOULD_LAST=6
CPU0_MIN_FREQ=`cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq`
FREQ_ONLINE_1=360000
FREQ_ONLINE_2=460000
FREQ_ONLINE_3=787000
FREQ_ONLINE_4=960000
FREQ_ONLINE_5=1248000
FREQ_ONLINE_6=1440000

while true; do
  # get cpu0 freq
  CPU0_CUR_FREQ=`cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq`

  if [ $CPUS_SHOULD_LAST != $CPUS_SHOULD ];
  then
    echo $CPU0_CUR_FREQ, should_cores: $CPUS_SHOULD
    CPUS_SHOULD_LAST=$CPUS_SHOULD
  fi 

  if [ $CPUS_SHOULD -le 4 ];
  then
    SLEEP_PLUS=50000
  else
    SLEEP_PLUS=150000
  fi
  
  if [ $CPUS_SHOULD -ge 5  ];
  then
    SLEEP_MINUS=50000
  else
    SLEEP_MINUS=150000
  fi  

  if [ $CPU0_CUR_FREQ = $FREQ_ONLINE_1 ];
  then
    if [ $CPUS_SHOULD -gt 1 ];
    then
#      echo 0 > /sys/devices/system/cpu/cpu$(expr $CPUS_SHOULD - 1)/online
#      CPUS_SHOULD=$(expr $CPUS_SHOULD - 1)
      usleep $SLEEP_MINUS
      continue
    fi
  fi
  
  if [ $CPU0_CUR_FREQ -ge $FREQ_ONLINE_2 -a $CPU0_CUR_FREQ -lt $FREQ_ONLINE_3 ];
  then
    if [ $CPUS_SHOULD -gt 2 ];
    then
      echo 0 > /sys/devices/system/cpu/cpu$(expr $CPUS_SHOULD - 1)/online
      CPUS_SHOULD=$(expr $CPUS_SHOULD - 1)
      usleep $SLEEP_MINUS
      continue
    elif [ $CPUS_SHOULD -lt 2 ];
    then
      CPUS_SHOULD=$(expr $CPUS_SHOULD + 1)
      echo 1 > /sys/devices/system/cpu/cpu$(expr $CPUS_SHOULD - 1)/online
      usleep $SLEEP_PLUS
      continue
    fi
  fi

  if [ $CPU0_CUR_FREQ -ge $FREQ_ONLINE_3 -a $CPU0_CUR_FREQ -lt $FREQ_ONLINE_4 ];
  then
    if [ $CPUS_SHOULD -gt 3 ];
    then
      echo 0 > /sys/devices/system/cpu/cpu$(expr $CPUS_SHOULD - 1)/online
      CPUS_SHOULD=$(expr $CPUS_SHOULD - 1)
      usleep $SLEEP_MINUS
      continue
    elif [ $CPUS_SHOULD -lt 3 ];
    then
      CPUS_SHOULD=$(expr $CPUS_SHOULD + 1)
      echo 1 > /sys/devices/system/cpu/cpu$(expr $CPUS_SHOULD - 1)/online
      usleep $SLEEP_PLUS
      continue
    fi
  fi

  if [ $CPU0_CUR_FREQ -ge $FREQ_ONLINE_4 -a $CPU0_CUR_FREQ -lt $FREQ_ONLINE_5 ];
  then
    if [ $CPUS_SHOULD -gt 4 ];
    then
      echo 0 > /sys/devices/system/cpu/cpu$(expr $CPUS_SHOULD - 1)/online
      CPUS_SHOULD=$(expr $CPUS_SHOULD - 1)
      usleep $SLEEP_MINUS
      continue
    elif [ $CPUS_SHOULD -lt 4 ];
    then
      CPUS_SHOULD=$(expr $CPUS_SHOULD + 1)
      echo 1 > /sys/devices/system/cpu/cpu$(expr $CPUS_SHOULD - 1)/online
      usleep $SLEEP_PLUS
      continue
    fi
  fi
  
  if [ $CPU0_CUR_FREQ -ge $FREQ_ONLINE_5 -a $CPU0_CUR_FREQ -lt $FREQ_ONLINE_6 ];
  then
    if [ $CPUS_SHOULD -gt 5 ];
    then
      echo 0 > /sys/devices/system/cpu/cpu$(expr $CPUS_SHOULD - 1)/online
      CPUS_SHOULD=$(expr $CPUS_SHOULD - 1)
      usleep $SLEEP_MINUS
      continue
    elif [ $CPUS_SHOULD -lt 5 ];
    then
      CPUS_SHOULD=$(expr $CPUS_SHOULD + 1)
      echo 1 > /sys/devices/system/cpu/cpu$(expr $CPUS_SHOULD - 1)/online
      usleep $SLEEP_PLUS
      continue
    fi
  fi
  
  if [ $CPU0_CUR_FREQ -ge $FREQ_ONLINE_6 ];
  then
    if [ $CPUS_SHOULD -lt 6 ];
    then
      CPUS_SHOULD=$(expr $CPUS_SHOULD + 1)
      echo 1 > /sys/devices/system/cpu/cpu$(expr $CPUS_SHOULD - 1)/online
      usleep $SLEEP_PLUS
      continue
    fi
  fi

  # Wait before checking again.
  usleep 50000
done
