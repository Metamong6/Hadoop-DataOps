# Zookeeper
echo " ---------------- Zookeeper -----------------"
parallel-ssh -h ~/.ssh/master -i "/usr/local/zookeeper/bin/zkServer.sh stop"

# Hadoop
echo " ------------------ Hadoop ------------------"
stop-dfs.sh

# Yarn
echo " ------------------- yarn -------------------"
#echo "Stopping nodemanager"
#parallel-ssh -h ~/.ssh/worker "yarn --daemon stop nodemanager"
#echo "Stopping resourcemanager [master01 master02]"
#parallel-ssh -h ~/.ssh/master "yarn --daemon stop resourcemanager"
stop-yarn.sh

# Jps check
echo " -------------------- jps -------------------"
sh ~/sh/cluster/jps-check-all.sh

