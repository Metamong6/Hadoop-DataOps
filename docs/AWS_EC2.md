## AWS EC2
노션 - [AWS EC2](https://www.notion.so/AWS-EC2-ac41339ecb39420f8ff68b38d984dcb5)

### 인스턴스 기초적 환경 구성

- ubuntu 20.04 TLS - Canonical, Ubuntu, 20.04 LTS, amd64 focal image build on 2022-09-14; 64bit-x86
    - master01, 02 → t3a.medium 30GB
    - master03(utility) → t3a.xlarge → t3a.2XL 50GB ( Hive 이슈)
    - slave01, 02 → t3a.medium 50GB
    

간략한 연결 및 구성 과정.

1. Instance 끼리 연결위해 각 인스턴스의 키값을 모든 인스턴스에 입력한다. 
(데이터 주고받을수있게 서로 가지고 있어야함!)
    
    local 에서 config 파일을 만들어서 기본적인 public IP 들을 등록해놓고 사용에 편리하도록 하며, 
    `vim ~/.ssh/config` → public ip 
    `ssh-keygen -t rsa`  → ssh 의 key를 서로의 인스턴스에 값을 등록해놓아서 병렬적인 명령 처리에 용이 하도록 `paralle-ssh` 등 설치하여 진행.
    `cat >> ~/.ssh/authorized_keys < ~/.ssh/id_rsa.pub
    cat ~/.ssh/id_rsa.pub → vi /home/ubuntussh/authorized_keys 키값입력`
    
2. parallel-ssh 및 1번의 진행 과정.
    - 명령어
        
        ```bash
        sudo apt install python3-pip
        # ssh 관련 패키지 설치
        # sshpass
        $ sudo apt install -y sshpass
        # parallel-ssh
        $ sudo apt install -y python3-pip python-setuptools
        $ sudo pip install parallel-ssh
        $ sudo apt install -y pssh
        # ssh 배포 서버 키 생성
        $ ssh-keygen
        ```
        
        ```bash
        sudo apt install python3-pip
        ```
        
        - SSH 키 생성 (실행 후 엔터 세번 입력)
        
        ```bash
        ssh-keygen -t rsa
        ```
        
        ```bash
        Generating public/private rsa key pair.
        Enter file in which to save the key (/home/ubuntu/.ssh/id_rsa):
        Enter passphrase (empty for no passphrase):
        Enter same passphrase again:
        Your identification has been saved in /home/ubuntu/.ssh/id_rsa
        Your public key has been saved in /home/ubuntu/.ssh/id_rsa.pub
        The key fingerprint is:
        SHA256:블라블라... ubuntu@master1
        The key's randomart image is:
        +---[RSA 3072]----+
        |                 |
        |     .           |
        |    o .  .        |
        |   . . o  .       |
        |    = o S  .  .   |
        |   = o o ...+o + |
        |  * . + ..++*.E.+|
        | + o . o.+.=o=+++|
        |  .     o+=o*Boo+|
        +----[SHA256]-----+
        ```
        
        - 새롭게 파일이 생성된 것 확인
        - id_rsa 는 OPENSSH PRIVATE KEY
        - id_rsa.pub 은 퍼블릭 키
        
        ```bash
        $ ls -al .ssh/
        
        total 20
        drwx------ 2 ubuntu ubuntu 4096 May  2 07:28 .
        drwxr-xr-x 4 ubuntu ubuntu 4096 May  2 07:01 ..
        -rw------- 1 ubuntu ubuntu  970 May  2 07:31 authorized_keys
        -rw------- 1 ubuntu ubuntu 2610 May  2 07:28 id_rsa
        -rw-r--r-- 1 ubuntu ubuntu  574 May  2 07:28 id_rsa.pub
        ```
        
        - authorized_keys 에 pub 키를 추가하여 인스턴스 복제를 했을 때 접속이 가능하도록 설정
        
        ```bash
        cat >> ~/.ssh/authorized_keys < ~/.ssh/id_rsa.pub
        ```
        
        - config 파일을 만들듯이 각 인스턴스의 타이틀을 저장한 파일 생성(all, master, slave)
        
        ```bash
        "all"                                                                            1,1           All
        master01
        master02
        master03
        slave01
        slave02
        
        "master"                                                                            1,1           All
        master01
        master02
        master03
        
        "slave"
        slave01
        slave02
        ```
        
        - 필요에 따라 pssh로 명령
        
        ```bash
        parallel-ssh -h ~/.ssh/all -i "cd ~/downloads && wget https://dlcdn.apache.org/zookeeper/zookeeper-3.8.0/apache-zookeeper-3.8.0-bin.tar.gz"
        parallel-ssh -h ~/.ssh/all -i "cd ~/downloads && sudo tar -xzvf apache-zookeeper-3.8.0-bin.tar.gz -C /usr/local"
        parallel-ssh -h ~/.ssh/all -i "cd /usr/local/ && sudo chown -R $USER:$USER /usr/local/apache-zookeeper-3.8.0-bin"
        parallel-ssh -h ~/.ssh/all -i "cd /usr/local && sudo ln -s /usr/local/apache-zookeeper-3.8.0-bin zookeeper"
        ```
        

1. 그리고 기본적으로 배운 내용에 따라 Hadoop(Hdfs, Yarn, Zookeeper, Hive) 및 Spark 환경 구성을 위해 설치.
