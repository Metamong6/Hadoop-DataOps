#! /bin/bash

# Goal :  Get rawdata from NYC-taxi-data from web

# PATH
RAWDATA=/home/ubuntu/downloads/rawdata
WH=/home/ubuntu/downloads/rawdata/warehouse
YW=/home/ubuntu/downloads/rawdata/warehouse/data/yellow

# VARIABLES
YEARS="2017 2018"
MONTHS="01 02 03 04 05 06 07 08 09 10 11 12"

# check YEAR dir exists
cd $YW # move to warehouse dir
echo "Moved to warehouse/data/yellow Dir : " `pwd` # echo present position


# function wget_raw_data
wget_raw_data(){
	for y in ${YEARS[@]};   do
		# chk year dir
	       	if ! test -d $YW/${y}; then
			cd $YW
			mkdir -p $YW/${y}
			cd $YW/${y}
			# because there was no year dir -> create month dir and wget raw data
			for m in ${MONTHS[@]}; do
				mkdir -p $YW/${y}/${m}
				cd $YW/${y}/${m}
                                wget https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_${y}-${m}.parquet
			done
		elif test -d $YW/${y}; then
			for m in ${MONTHS[@]}; do
				cd $YW/${y}
				# if month dir exists -> wget rawdata
				if test -d $YW/${y}/${m}; then
					cd $YW/${y}/${m}
					wget https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_${y}-${m}.parquet
				elif ! test -d $YW/${y}/${m}; then
					mkdir -p $YW/${y}/${m}
					cd $YW/${y}/${m}
                                        wget https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_${y}-${m}.parquet
				fi
			done

		fi
	done

}
# --- func done ---

echo "function wget_raw_data() called:"
wget_raw_data
echo "wget_raw_data() done!"

exit 0
