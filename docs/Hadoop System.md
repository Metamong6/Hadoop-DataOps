## Hadoop System

[Hadoop System](https://www.notion.so/Hadoop-System-e2b4969bdb094cbc9cf7f5b5f5a2d36c)

## Distributed System 분산 시스템

> "분산 시스템"이란 복수의 컴퓨터가 네트워크를 통해 통신하며 하나의 목적을 위해 서로 간에 상호작용하는 것입니다. 다수의 컴퓨터가 마치 하나인 것처럼 동작하는 시스템인 것입니다. 분산 시스템을 구성할때 고려해야 할 사항들은 네트워크의 신뢰성, 지연, 대역폭, 안전성, 토폴로지에 대한 고려, 전송 비용, 네트워크 유형 등 고려해야 할 사항이 많습니다. 분산 서버들 간의 정보 공유, 동기화 분산 서버들의 상태 확인등이 필요하다. 분산 컴퓨팅에서 코디네이션의 예는 그룹 멤버십(Group Membership), 잠금제어(Locking), 공급/구독 (Publisher/ Subscriber), 리더선정(Leader Election), 동기화(Synchronization)등이 될 수 있습니다.
> 
> 
> 출처: [https://alnova2.tistory.com/1044](https://alnova2.tistory.com/1044)[몽상가:티스토리]
> 

## HDFS - Hadoop Distributed File System

⇒ 우선 간단하게만 말하자면, 하둡 프레임워크는 파일 시스템인 HDFS(*Hadoop Distributed File System*)과 데이터를 처리하는 맵리듀스(*MapReduce*) 엔진을 합친 것으로 대규모 클러스터 상의 데이터 처리를 다음과 같은 방식으로 단순화합니다.

1. 잡을 잘게 분할하고 클러스터의 모든 노드로 매핑(*map*)
2. 각 노드는 잡을 처리한 중간결과를 생성하고
3. 분할된 중간 결과를 집계(*reduce*)해서 최종 결과를 낸다.

![Untitled](https://user-images.githubusercontent.com/102719063/203529874-e440cd52-7224-4742-8fec-ad8c1e172ab9.png)

source : 홍태희 강사님.

- 마스터 – 슬레이브 구조
- 큰 파일을 여러 개의 **Block** 으로 나누어 저장
- 슬레이브 노드의 쉬운 확장 가능
- 신뢰성 보장 – 데이터 복제본 자동 관리
- 한번 쓰고 많은 읽기가 있는 오퍼레이션에 최적화
- 블록 크기 분할과 추상화에 따른 이점
- 같은 파일을 분산 처리하여 데이터 처리 성능을 개선할 수 있음
- 블록 단위로 나누어 저장하기 때문에 디스크 사이즈보다 더 큰 파일을 보관할 수 있음
- 파일 단위보다 블록 단위로 추상화를 하면 스토리지의 서브 시스템을 단순하게 만들 수 있으며, 파일 탐색 지점이나 메타정보를 저장할 때 사이즈가 고정되어 있으므로 구현이 용이함
- 내고장성을 제공하는데 필요한 복제(replication)을 구현할 때 매우 적합
- 같은 노드에 같은 블록이 존재하지 않도록 복제하여 노드가 고장일 경우 다른 노드의 블록으로 복구할 수 있음

- 하둡에서의 **블록block** 개념!
    - 하나의 파일을 여러 개의 Block으로 저장
    - 설정에 의해 하나의 Block 은 64MB 또는 128MB 등의 큰 크기로 나누어 저장
    - 블록 크기가 128MB 보다 적은 경우는 실제 크기 만큼만 용량을 차지함

## Tools

### ZOOKEEPER

⇒ Distribution Coordination Service Tool. 분산 코디네이션 서비스를 위한 오픈소스 프로젝트로서, 분산 처리 환경에서 사용 가능 한 데이터 저장소인 셈이자 중앙화된 분산 코디네이터이다.

ZooKeeper는 클러스터 구성원 간의 데이터 공유를 위한 Data Storage(영속 데이터/임시 데이터), 클러스터 멤버십 관리를 통한 데이터 변경 통지(Watch), 마스터 및 분산 락 등에 활용되는 시퀀스 노드Sequence Node 등을 제공하며, 이를 통해서 다음에 활용할 수 있습니다. 

1) 설정 관리 (Configuration Management) 

2) 분산 클러스터 관리 (Distributed Cluster Management) 

3) 명명 서비스 (Naming Service: e.g. DNS) 

4) 분산 동기화 (Distributed Synchronization : locks, barriers, queues) 

5) 분산 시스템에서 리더 선출 (Leader election in a distributed system) 

6) 중앙집중형 신뢰성 있는 데이터 저장소 (Centralized and highly reliable data registry) 

$\therefore$ ZooKeeper는 중앙화된 분산 코디네이터 이다.

- 활용 분야
    - 서버 간의 정보 공유 (설정 관리)
    - 서버 투입, 제거 시 이벤트 처리(클러스터 관리)
    - 리더 선출
    - 서버 모니터링
    - 분산 락 처리
    - 장애 상황 판단

HDFS는 네임노드가 단일 실패 지점이 될 수 있는데, 네임노드에 문제가 발생하면 모든 작업이 중지되고, 파일을 읽거나 쓸수 없게 됩니다. 하둡 v2에서 이 문제를 해결하기 위해서 HDFS 고가용성(High Availability)을 제공합니다.

HDFS 고가용성은 이중화된 두대의 서버인 액티브(active) 네임노드와 스탠바이(standby) 네임노드를 이용하여 지원합니다. 액티브 네임노드와 스탠바이 네임노드는 데이터 노드로부터 블록 리포트와 하트비트를 모두 받아서 동일한 메타데이터를 유지하고, 공유 스토리지를 이용하여 에디트파일을 공유합니다.

액티브 네임노드는 네임노드의 역활을 수행하고, 스탠바이 네임노드는 액티브 네임노드와 동일한 메타데이터 정보를 유지하다가, 액티브 네임노드에 문제가 발생하면 스탠바이 네임노드가 액티브 네임노드로 동작하게 됩니다. 액티브 네임노드에 문제가 발생하는 것을 자동으로 확인하는 것이 어렵기 때문에 보통 주키퍼를 이용하여 장애 발생시 자동으로 변경될 수 있도록 합니다.

스탠바이 네임노드는 세컨더리 네임노드의 역할을 동일하게 수행합니다. 따라서 HDFS를 고가용성 모드로 설정하였을 때는 세컨더리 네임노드를 실행하지 않아도 됩니다. 고가용성 모드에서 세컨더리 네임노드를 실행하면 오류가 발생합니다.

#### **QJM(Quorum Journal Manager) → Zookeeper**

![source _ 홍태희 강사님](https://user-images.githubusercontent.com/102719063/203529882-52ec4af9-74e4-4d74-b816-a23292b27e69.png)

source : 홍태희 강사님.

**Trouble Shooting:**

- 🧑‍🎓HDFS ZKFC를 초기화 하는 이유..?
    
    hadoop file system zookeeper Failover Controller
    
    **ZKFailoverController**(ZKFC)는 NameNode의 상태를 모니터링하고 관리하는 ZooKeeper 클라이언트인 새로운 구성 요소입니다. 
    **zookeeper-based election**: 로컬 NameNode를 활성화하기 위해 장애 조치를 실행하는 권한이 있습니다.
    
    zkfc 초기화를 하면 자동 장애 조치 시스템이 데이터를 저장하는 ZooKeeper에 znode가 생성됩니다.
    `hdfs zkfc -formatZK` 
    
    구성에서 자동 장애 조치가 활성화 되었으므로 이제 start-dfs.sh 스크립트는 NameNode를 실행하는 모든 시스템에서 ZKFC 데몬을 자동으로 시작합니다. ZKFC가 시작되면 활성화될 NameNode 중 하나를 자동으로 선택합니다.
    
    참고자료:
    
    [https://stackoverflow.com/questions/33311585/how-does-hadoop-namenode-failover-process-works](https://stackoverflow.com/questions/33311585/how-does-hadoop-namenode-failover-process-works)
    
    [https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-hdfs/HDFSHighAvailabilityWithQJM.html#Automatic_Failover](https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-hdfs/HDFSHighAvailabilityWithQJM.html#Automatic_Failover)
    
    [https://dydwnsekd.tistory.com/46](https://dydwnsekd.tistory.com/46)
    

### HDFS

HDFS는 마스터 슬레이브 구조로 하나의 네임노드와 여러 개의 데이터노드로 구성됩니다. 네임노드는 메타데이터를 가지고 있고, 데이터는 블록 단위로 나누어 데이터노드에 저장됩니다. 사용자는 네임노드를 이용해 데이터를 쓰고, 읽을 수 있습니다.

![source _ 홍태희 강사님 (1)](https://user-images.githubusercontent.com/102719063/203529878-ccf3dbe9-595a-497c-bf73-81b50640b9c3.png)

source : 홍태희 강사님.

네임노드는 파일 정보 메타데이터를 메모리에서 관리합니다. 파일이 많아지면 메모리 사용량이 늘어나게 되고, 메모리 관리가 문제가 됩니다. 이를 해결하기 위해 하둡 v2 부터 HDFS 페더레이션을 지원합니다. HDFS는 네임노드 에 문제가 발생하면 모든 작업이 중지되고, 파일을 읽거나 쓸수 없게 됩니다. 하둡 v2에서 이 문제를 해결하기 위해서 HDFS 고가용성(High Availability)을 제공합니다.

HDFS 고가용성은 이중화된 두대의 서버인 액티브(active) 네임노드와 스탠바이(standby) 네임노드를 이용하여 지원합니다. 액티브 네임노드와 스탠바이 네임노드는 데이터 노드로부터 블록 리포트와 하트비트를 모두 받아서 동일한 메타데이터를 유지하고, 공유 스토리지를 이용하여 에디트파일을 공유합니다.

HDFS 페더레이션은 디렉토리(네임스페이스) 단위로 네임노드를 등록하여 사용하는 것입니다. 예를 들어 user, hadoop, tmp 세개의 디렉토리가 존재할 때, /user, /hadoop, /tmp 디렉토리 단위로 총 3개의 네임노드를 실행하여 파일을 관리하게 하는 것입니다.

HDFS 페더레이션을 사용하면 파일, 디렉토리의 정보를 가지는 네임스페이스와 블록의 정보를 가지는 블록 풀을 각 네임노드가 독립적으로 관리합니다. 네임스페이스와 블록풀을 네임스페이스 볼륨이라하고 네임스페이스 볼륨은 독립적으로 관리되기 때문에 하나의 네임노드에 문제가 생겨도 다른 네임노드에 영향을 주지 않습니다.

**Trouble Shooting:**

- ⚠️  error : slave1 save2 에`data node` 실행되지않음
    
    
    원인 :  namenode namespaceID와 datanode namespaceID가 일치하지 않을 경우 발생하는 에러.
    datanode 가 이전에 만들어진 데이터를 가지고 있기 때문에namenode -format 을 하였을 경우 주로 발생한다.
    
    ![Untitled (2)](https://user-images.githubusercontent.com/102719063/203530453-1ece7b8d-1880-432d-be1e-b47ccefab1fe.png)
    
    해결>> 데이터를 저장하는 대상 폴더를 다 지우고, 해당 폴더들을 다시 생성한 후 start-all.sh로 다시 기동하면 된다.
    
    ```
    vi hadoop-site.xml # datanode 경로확인
    /usr/local/hadoop/data/name
    rm -rf current
    ```
    

### YARN

**YARN (Yet Another Resource Negotiator)**은 하둡2에서 도입한 클러스터 리소스 관리 및 애플리케이션 라이프 사이클 관리를 위한 아키텍처입니다. YARN은 잡트래커의 기능을 분리하여 자원 관리는 **리소스 매니저**와 **노드매니저**, 애플리케이션 라이프 사이클 관리 기능은 **애플리케이션 마스터**와 **컨테이너**가 담당하도록 구성되었습니다.

하둡1에서는 잡트래커Job Tracker가 애플리케이션의 라이프 사이클 관리와 클러스터 리소스 관리를 모두 담당하여 병목 현상이 발생하였습니다.

잡트래커 한대가 클러스터의 모든 노드를 관리해야 하고, 모든 애플리케이션의 관리 하였기 때문에 잡트래커에 많은 메모리를 할당 해야 했고, 잡트래커는 슬롯 단위로 리소스를 관리하여 시스템의 전체 자원을 효율적으로 사용할 수 없었습니다. 

슬롯 단위 리소스 관리는 클러스터의 메모리, CPU 자원을 분할하여 슬롯단위로 구분합니다. 100GB의 메모리를 가지는 클러스터를 1G로 구분하여 100개의 슬롯을 만들고, 60개의 맵 슬롯, 40개의 리듀서 슬롯으로 구분합니다. 슬롯은 각각의 역활에 맞게 동작할 수 있습니다. 따라서 맵 슬롯이 동작하는 동안 리듀서 슬롯은 대기하게 됩니다. 맵 슬롯에 더 많은 일을 하게 되더라도 리듀서 슬롯은 대기하게 됩니다.

잡 트래커의 애플리케이션은 맵리듀스 작업만 처리할 수 있어서 유연성이 부족하였습니다. 맵리듀스 API를 구현한 작업만 처리할 수 있었기 때문에 SQL 기반 작업의 처리나, 인메모리 기반의 작업의 처리에 어려움이 있었습니다.

이런 단점을 극복하기 위하여 YARN 아키텍처가 도입되었습니다.

#### Resource Managing

클러스터 자원 관리는 리소스 매니저(ResourceManager)와 노드매니저(NodeManager)를 이용하여 처리 합니다.

노드매니저는 클러스터의 각 노드마다 실행됩니다. 현재 노드의 자원 상태를 관리하고, 리소스매니저에 현재 자원 상태를 보고합니다.

리소스매니저는 노드매니저로부터 전달받은 정보를 이용하여 클러스터 전체의 자원을 관리합니다. 자원 사용 상태를 모니터링하고, 애플리케이션 마스터에서 자 자원을 요청하면 비어 있는 자원을 사용할 수 있도록 처리합니다.

자원을 분배하는 규칙을 설정하는 것이 스케줄러(Scheduler)입니다. 스케줄러에 설정된 규칙에 따라 자원을 효율적으로 분배합니다.

**Trouble Shooting:**

- 🧑‍🎓 yarn cluster의 리소스 매니저가 2개가 되는이유?
    
    ![Untitled (1)](https://user-images.githubusercontent.com/102719063/203529870-c8b3385c-2843-4e14-b64e-fe0214965bec.png)
    
    리소스 매니저는 YARN 클러스터의 Master 서버로 하나 또는 이중화를 위해 두개의 서버에만 실행됨
    
    참고자료: [https://data-wiki.tistory.com/17](https://data-wiki.tistory.com/17)
    

### HIVE

- 하이브는 SQL을 하둡에서 사용하기 위한 프로젝트로 시작
- 페이스북에서 자사의 데이터 분석을 위해 개발하여 아파치 오픈소스 프로젝트로 오픈
- 하둡에 저장되는 데이터 중 정형 데이터의 비중이 높을 수록 활용도가 높으며, 최근에는 Spark SQL 을 많이 사용하지만, 큰 데이터 처리에는 여전히 유용한 엔진이며 Spark SQL 대비 기능적인 장점도 존재

#### 하이브 구성요소

- **UI**
    - 사용자가 쿼리 및 기타 작업을 시스템에 제출하는 사용자 인터페이스
    - CLI, Beeline, JDBC 등
- **Driver**
    - 쿼리를 입력받고 작업을 처리
    - 사용자 세션을 구현하고, JDBC/ODBC 인터페이스 API 제공
- **Compiler**
    - 메타 스토어를 참고하여 쿼리 구문을 분석하고 실행계획을 생성
- **Metastore**
    - DB, Table, Partition의 정보를 저장
- **Execution Engine**
    - 컴파일러에 의해 생성된 실행 계획을 실행

![image-hive](https://user-images.githubusercontent.com/102719063/203529862-a8035a87-1fe6-459d-ade5-682e8290520e.png)

하이브는 편리한 작업을 위한 몇가지 서비스를 제공합니다.

#### **메타스토어**

메타스토어 서비스는 HDFS 데이터 구조를 저장하는 실제 데이터베이스를 가지고 있습니다. 메타스토어는 3가지 실행모드가 있습니다.

테스트로 동작할 때는 임베이디드 모드를 사용하고, 실제 운영에서는 리모트 모드를 많이 사용합니다.

- 임베이디드(Embeded)
    - 별도의 데이터 베이스를 구성하지 않고 더비 DB를 이용한 모드
    - 한번에 하나의 유저만 접근 가능
- 로컬(Local)
    - 별도의 데이터베이스를 가지고 있지만, 하이브 드라이버와 같은 JVM에서 동작
- 리모트(Remote)
    - 별도의 데이터베이스를 가지고, 별도의 JVM에서 단독으로 동작하는 모드
    - 리모트로 동작하는 하이브 메타스토어를 HCat 서버라고도 함

#### **하이브서버2(hiveserver2)**

하이브서버2는 다른 언어로 개발된 클라이언트와 연동 서비스를 제공합니다. 기존 하이브서버1을 개선하여 인증과 다중 사용자 동시성을 지원합니다. 쓰리프트, JDBC, ODBC 연결을 사용하는 애플리케이션과 통신하여 하이브 연산을 수행하고 결과를 반환합니다.

#### **비라인(beeline)**

일반적인 CLI 처럼 내장형 모드로 작동하거나 JDBC로 하이브서버2 프로세스에 접근할 수 있는 하이브의 명령행 인터페이스입니다. CLI는 로컬 하이브 서비스에만 접근할 수 있지만 비라인은 원격 하이브 서비스에 접속할 수 있습니다.

**Trouble Shooting:**

- 🛤️Hive
    
    계속 Hive 및 MapReducing 과정에서 Pipeline Broke issue가 있었는데 yarn config, mapred config 등을 아무리 늘려도 기본적인 리소스가 최소 VCPU 8, 32 Gib 정도는 되어야 한다는 멘토님의 말씀에 따라서 최종적으로 늘림.
