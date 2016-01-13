#!/system/bin/sh

if [ -e $TMPDIR/cpu_hotplug_last_pid.txt ];
then
  PID=`cat $TMPDIR/cpu_hotplug_last_pid.txt`
  rm $TMPDIR/cpu_hotplug_last_pid.txt
else
  PID=`ps w | grep "cpu_freq_hotplug.sh" | grep "{cpu_freq" | grep -oE "^ *[0-9]+" | grep -oE "[0-9]+"`
fi

if [ "$PID" != "" ];
then
  kill $PID &>/dev/null
  echo service stopped
  ./all_core_enable.sh
else
  echo service not running
fi
