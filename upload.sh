#!/bin/bash

### Set initial time of file
LTIME=`stat -c %Z synth.ino`

while true
do
   ATIME=`stat -c %Z synth.ino`

   if [[ "$ATIME" != "$LTIME" ]]
   then
                                arduino-cli compile --fqbn arduino:avr:nano Synth
                                arduino-cli upload -p /dev/ttyUSB0 --fqbn arduino:avr:nano Synth
       LTIME=$ATIME
   fi
   sleep 5
done



