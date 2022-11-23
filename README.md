# Hadoop-DataOps - Data Engineering
Main : 김주호, 송지원, 

<br /><br />

## Data
**TLC Trip Record Data** - Yellow Taxi Data, 2017~2018 for Training
from. https://www1.nyc.gov/site/tlc/about/tlc-trip-record-data.page

Docs : [Data Source & EDA](https://github.com/Metamong6/Hadoop-DataOps/blob/main/docs/Data%20Source%20%26%20EDA.md)

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
[**전체적 구축 과정**](https://github.com/Metamong6/Hadoop-DataOps/blob/main/docs/%EB%8D%B0%EC%9D%B4%ED%84%B0%20%ED%8C%8C%EC%9D%B4%ED%94%84%EB%9D%BC%EC%9D%B8%20%EA%B5%AC%EC%B6%95%20%EA%B3%BC%EC%A0%95.md)

<br /><br />

## AWS EC2
Docs : [AWS EC2](https://github.com/Metamong6/Hadoop-DataOps/blob/main/docs/AWS_EC2.md)

## Hadoop based(HDFS, Hive, Zookeeper, Yarn on Spark)
Docs : [Hadoop System](https://github.com/Metamong6/Hadoop-DataOps/blob/main/docs/Hadoop%20System.md)

File : https://github.com/Metamong6/Hadoop-DataOps/tree/main/hadoop_settings/hadoop

### Hive
File : https://github.com/Metamong6/Hadoop-DataOps/tree/main/hadoop_settings/hive

### Zookeeper
Files : https://github.com/Metamong6/Hadoop-DataOps/blob/main/hadoop_settings/zookeeper

### Yarn on Spark & Pyspark
Docs : [Apache Spark](https://github.com/Metamong6/Hadoop-DataOps/blob/main/docs/Apache%20Spark.md)

Files : https://github.com/Metamong6/Hadoop-DataOps/tree/main/spark_settings


