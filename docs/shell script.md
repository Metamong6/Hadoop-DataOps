# 클러스터 실행 자동화(쉘 스크립트)

**Why?**

매번 하나씩 component를 실행하는데 번거로움

jps도 한번에 전체 노드를 확인하면 보기 편리함

<br /><br />

###  Cluster 관련 쉘스크립트
해당의 파일들 : [shell_scripts/cluster](https://github.com/Metamong6/Hadoop-DataOps/tree/main/shell_scripts/cluster)

- **cluster-start-all.sh** : zookeeper, hadoop, yarn 실행 후 jps 확인

- **cluster-stop-all.sh** : zookeeper, hadoop, yarn stop 후 jps 확인

    slave1과 slave2의 datanode가 정상적으로 멈추지 않는 이슈가 있음.
    
    → `$HADOOP_HOME/sbin/stop-all.sh` 을 세분화하는 작업이 필요.
 
- **jps-check-all.sh** : 전체 노드 jps 확인

 **masterfile & slavefile** 
parallel-ssh 로 원활한 사용을 위해 해당에 미리 설정해놓은 hostname 목록. 각자 계획했던 node의 이름에 따른 것. 

**노드 포맷 후 클러스터 실행**
<img src="https://github.com/Metamong6/Hadoop-DataOps/blob/main/docs/src/%EB%85%B8%EB%93%9C%20%ED%8F%AC%EB%A7%B7%20%ED%9B%84%20%ED%81%B4%EB%9F%AC%EC%8A%A4%ED%84%B0%20%EC%8B%A4%ED%96%89.gif" alt="노드 포맷 후 클러스터 실행.gif">

---

###  Data 관련 쉘스크립트
해당의 파일들 : [shell_scripts/data](https://github.com/Metamong6/Hadoop-DataOps/tree/main/shell_scripts/data)

- **hdfs-data-load.sh** : ec2 raw data 를 hdfs 옮김
  - 당시에는 하나하나 체크하기보다는 hdfs에서 읽거나 적재 시에 데이터가 통으로 날라가는 이슈들이 있어서 그냥 통으로 옮기는 것만을 목표로 함.

- **test-code.sh** : 파티셔닝 개념으로서 년/월/일 기준으로 경로를 잡아서 진행. 경로는 hive 기준.

- **wget-rawdata.sh** : NYC-taxi-data 의 다운로드 경로를 잡아서 간략하게 for loop으로 다운로드 하여 EC2에 저장.

**hdfs에 rawdata 적재 후 pyspark로 전처리**
<img src="https://github.com/Metamong6/Hadoop-DataOps/blob/main/docs/src/hdfs%EC%97%90%20rawdata%20%EC%A0%81%EC%9E%AC%20%ED%9B%84%20pyspark%EB%A1%9C%20%EC%A0%84%EC%B2%98%EB%A6%AC.gif" alt="hdfs에 rawdata 적재 후 pyspark로 전처리.gif">
