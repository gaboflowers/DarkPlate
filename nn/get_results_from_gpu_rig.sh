#!/bin/bash -e

cd /home/gflores/src/DarkPlate/nn

# Warning: this file is automatically created/updated by DarkMark v1.8.27-1!
# Created on Thu 2024-08-01 15:14:11 -04 by gflores@Galaxy-960XFG.
#
# This script assumes you have 2 computers:
#
# - the first is the desktop where you run DarkMark and this script,
# - the second has a decent GPU and is where you train the neural network.
#
# It also assumes the directory structure for where neural networks are saved
# on disk is identical between both computers.
#
# Running this script *FROM THE DESKTOP COMPUTER* will retrieve the results
# (the .weights files) from 'gpurig' where training took place.

ping -c 1 -W 1 gpurig >/dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "Make sure the hostname 'gpurig' can be resolved or exists in the /etc/hosts file!"
else
#	rm -f nn*.weights
#	rm -f output.log
	rm -f chart.png

	rsync --update --human-readable --info=progress2,stats2 --times --no-compress gpurig:/home/gflores/src/DarkPlate/nn/\* .

	if [ -e chart.png ]; then
		eog chart.png
	fi
fi

