# Zookeeper
echo " ---------------- Zookeeper -----------------"
parallel-ssh -h ~/.ssh/master -i "/usr/local/zookeeper/bin/zkServer.sh start"

# Hadoop
echo " ------------------ Hadoop ------------------"
start-dfs.sh

# Yarn
echo " ------------------- yarn -------------------"
start-yarn.sh

# Jps check
echo " -------------------- jps -------------------"
sh ~/sh/cluster/jps-check-all.sh

