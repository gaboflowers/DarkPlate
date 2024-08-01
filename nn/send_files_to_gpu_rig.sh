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
# Running this script *FROM THE DESKTOP COMPUTER* will copy all of the
# necessary files (images, .txt, .names, .cfg, etc) from the desktop computer
# to the rig with the decent GPU so you can then start the training process.
#
# After this script has finished running, ssh to the GPU rig and run this to train:
#
#		/home/gflores/src/DarkPlate/nn/nn_train.sh
#

ping -c 1 -W 1 gpurig >/dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "Make sure the hostname 'gpurig' can be resolved or exists in the /etc/hosts file!"
else
	rsync --update --human-readable --recursive --no-inc-recursive --info=progress2,stats2 --times --no-compress . gpurig:/home/gflores/src/DarkPlate/nn
fi

