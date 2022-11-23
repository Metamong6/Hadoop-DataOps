#!/bin/bash

# Goal to get raw data from NYC taxi data

# HDFS DIR PATH
WH=/warehouse/
YW=/warehouse/data/yellow

# VARIABLES # period for get data
YEARS="2017 2018"
MONTHS="01 02 03 04 05 06 07 08 09 10 11 12"

# func chk_partition
chk_partition(){
	echo "starting chk_partition func!"
	echo `hadoop fs -ls $YW`
	for y in ${YEARS[@]}; do
		# No year directories -> mkdir
		if ! test -d $WH/${y}; then
			echo "no year dir!"
			`hdfs dfs -mkdir -p $YW/${y}`
			echo `hdfs dfs -ls $YW/${y}`     
		# Yes year directory -> No months -> mkdir month dir
		elif test -d $WH/${y}/; then
			for m in ${MONTHS[@]}; do
				if ! test -d $WH/${y}/${m}; then
					echo "create ${m} partition!"
					`hdfs dfs -mkdir -p $WH/${y}/${m}`
				elif test -d $WH/${y}/${m}; then
					echo "need to get raw data from web"
					# wget 
				fi
			done
		fi
	done
	echo "End of chk_partition func!"
}

# call function
chk_partition

