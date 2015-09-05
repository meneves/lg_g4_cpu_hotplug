# CPU Hot-plugging shell script for LG G4

A .sh script (acts as a linux deamon/service), that saves precious battery juice by shutting down inactive processor cores. 

Orginal LG G4 (H815) does not use cpu hot-plugging feature. 

U can use it with orginal kernel, so only rooted device is needed (no need to unlock bootloader).

# Usage

1) download all files and place it on sdcard

2) make sure you use "interactive" governor (default)

3) run terminal emulator and:

  * start service by calling ./start.sh
  * stop service by calling ./stop.sh


