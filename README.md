# Hadoop-DataOps

Data Engineering

<br /><br />

## Data
**TLC Trip Record Data** - Yellow Taxi Data, 2017~2018 for Training
from. https://www1.nyc.gov/site/tlc/about/tlc-trip-record-data.page


**Data Dictionary – Yellow Taxi Trip Records** : https://www1.nyc.gov/assets/tlc/downloads/pdf/data_dictionary_trip_records_yellow.pdf

**Shapefile from** - Taxi Zone Shapefile (PARQUET) https://d37ci6vzurychx.cloudfront.net/misc/taxi_zones.zip

#### Features
<p>tpep_pickup_datetime</p>
<p>tpep_dropoff_datetime</p>
<p>passenger_count</p>
<p>trip_distance</p>
<p>RatecodeID</p>
<p>PULocationID -> from Taxi Zone Shapefile</p>
<p>DOLocationID -> from Taxi Zone Shapefile</p>
<p>payment_type</p>
<br />

#### Target
<p>fare_amounts</p>
<br />

## Whole Flow & Tools
[<img width="1853" margin="0 auto" alt="mlops-full-tools" src="https://user-images.githubusercontent.com/102719063/198544580-768f153c-7e12-469f-8e01-a6257b0dda42.png" />
](https://user-images.githubusercontent.com/102719063/198544580-768f153c-7e12-469f-8e01-a6257b0dda42.png)

<br /><br />

## Hadoop based(HDFS, Hive, Yarn on Spark)
https://github.com/Metamong6/Hadoop-DataOps/tree/main/hadoop_settings/hadoop

### Hive
https://github.com/Metamong6/Hadoop-DataOps/tree/main/hadoop_settings/hive

### Zookeeper
zoo.cfg
https://github.com/Metamong6/Hadoop-DataOps/blob/main/hadoop_settings/zookeeper/zoo.cfg

### Yarn on Spark & Pyspark
https://github.com/Metamong6/Hadoop-DataOps/tree/main/spark_settings


