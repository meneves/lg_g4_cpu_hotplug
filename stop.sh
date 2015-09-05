#!/system/bin/sh

if [ -e last_pid.txt ];
then
  PID=`cat last_pid.txt`
  rm last_pid.txt
else
  PID=`ps w | grep "cpu_freq_hotplug.sh" | grep "{cpu_freq" | grep -oE "^[0-9]+"`
fi

if [ "$PID" != "" ];
then
  kill $PID &>/dev/null
  echo service stopped
  ./all_core_enable.sh
else
  echo service not running
fi
