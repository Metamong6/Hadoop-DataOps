#!/bin/bash

# Goal put ec2 raw data to hdfs

# PATH
WH=/warehouse/
YW=/warehouse/data/yellow

# VARIABLES - local 

# chk ls -ls /warehouse/data/yellow dir exist
if ! test -d "hadoop fs -ls $YW"; then
	echo "empty in $YW" `hadoop fs -ls $YW`
	# empty checked
	hadoop fs -copyFromLocal ~/downloads/rawdata/warehouse/data/yellow/* $YW
elif test -d "hadoop fs -ls $YW"; then
	echo "not empty in $YW: " `hadoop fs -ls $WH`
fi

exit 0
