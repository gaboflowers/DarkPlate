#!/bin/bash -e

cd /home/gflores/src/DarkPlate/nn

# Warning: this file is automatically created/updated by DarkMark v1.8.27-1!
# Created on Thu 2024-08-01 15:14:11 -04 by gflores@Galaxy-960XFG.

rm -f output.log
#rm -f chart.png

echo "creating new log file" > output.log
date >> output.log

ts1=$(date)
ts2=$(date +%s)
echo "initial ts1: ${ts1}" >> output.log
echo "initial ts2: ${ts2}" >> output.log
echo "cmd: /usr/bin/darknet detector -map -dont_show train /home/gflores/src/DarkPlate/nn/nn.data /home/gflores/src/DarkPlate/nn/nn.cfg" >> output.log

/usr/bin/time --verbose /usr/bin/darknet detector -map -dont_show train /home/gflores/src/DarkPlate/nn/nn.data /home/gflores/src/DarkPlate/nn/nn.cfg 2>&1 | tee --append output.log

ts3=$(date)
ts4=$(date +%s)
echo "ts1: ${ts1}" >> output.log
echo "ts2: ${ts2}" >> output.log
echo "ts3: ${ts3}" >> output.log
echo "ts4: ${ts4}" >> output.log

