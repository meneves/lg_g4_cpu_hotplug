#!/system/bin/sh

nice -n -1 nohup nice -n -1 ./cpu_freq_hotplug.sh &>/dev/null &
PID=$!

#another variant of low priority service
#ionice -c 3 -p 89 nice -n 19 nohup ionice -c 3 -p 89 nice -n 19 ./cpu_freq_hotplug.sh &>/dev/null &

if [ "$PID" != "" ];
then
  echo "service started, PID=$PID"
  echo $PID > $TMPDIR/cpu_hotplug_last_pid.txt
fi
