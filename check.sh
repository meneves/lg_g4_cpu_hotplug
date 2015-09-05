#!/system/bin/sh
PID=`ps w | grep "cpu_freq_hotplug.sh" | grep "{cpu_freq" | grep -oE "^[0-9]+"`
if [ "$PID" != "" ];
then
  echo service running
else
  echo service off
fi