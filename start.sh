#!/system/bin/sh
nice -n -1 nohup nice -n -1 ./cpu_freq_hotplug.sh &>/dev/null &
#ionice -c 3 -p 89 nice -n 19 nohup ionice -c 3 -p 89 nice -n 19 ./cpu_freq_hotplug.sh &>/dev/null &
PID=$!
#PID=`ps w | grep "cpu_freq_hotplug.sh" | grep "{cpu_freq" | grep -oE "^[0-9]+"`
if [ "$PID" != "" ];
then
  echo "service started, PID=$PID"
  echo $PID > last_pid.txt
fi

