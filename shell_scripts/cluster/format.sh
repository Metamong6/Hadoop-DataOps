# Runs only when instances are restarted

# Delete journalnode data
echo "Deleting journalnode datas on [master01 master02 master03]"
parallel-ssh -h ~/.ssh/master "cd /usr/local/hadoop/data/dfs/journalnode && rm -rf team06-hadoop-cluster"

# Delete datanode data
echo "Deleting datanode datas on [master03 slave01 slave02]"
parallel-ssh -h ~/.ssh/worker "cd /usr/local/hadoop/data/data && rm -rf current"

# Starting journalnode for namenode formatting
echo "Starting journalnodes on [master01 master02 master03]"
parallel-ssh -h ~/.ssh/master "hdfs --daemon start journalnode"

# Namenode format
echo "Namenode formatting"
hdfs namenode -format <<!
y
!

echo "Namenode starting test"
# Starting namenode master01
hdfs --daemon start namenode

# Starting namenode master02
ssh master02 hdfs namenode -bootstrapStandby <<!
y
!
ssh master02 hdfs --daemon start namenode

# Stopping journalnode
echo "Stopping journalnodes"
parallel-ssh -h ~/.ssh/master "hdfs --daemon stop journalnode"
echo "Stopping namenodes"
parallel-ssh -H master01 "hdfs --daemon stop namenode"
parallel-ssh -H master02 "hdfs --daemon stop namenode"

# Starting zookeeper for zkfc format
echo "Starting zookeeper"
parallel-ssh -h ~/.ssh/master "/usr/local/zookeeper/bin/zkServer.sh start"

# ZKFC format
echo "ZKFC formatting"
hdfs zkfc -formatZK <<!
y
!

# Stopping zookeeper
echo "Stopping zookeeper"
parallel-ssh -h ~/.ssh/master "/usr/local/zookeeper/bin/zkServer.sh stop" 

# jps check
echo "Jps check"
sh ~/sh/cluster/jps-check-all.sh
