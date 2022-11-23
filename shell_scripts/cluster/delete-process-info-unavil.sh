#! /bin/bash

# when jps -> -- process information unavailable
# ref : https://stackoverflow.com/questions/35394063/process-information-unavailable-jps-command-in-linux

parallel-ssh -h ~/.ssh/all -i "sudo rm -rf /tmp/hsperfdata_* && ls -la /tmp | grep hsperfdata_*"

# check jps
parallel-ssh -h ~/.ssh/all -i "jps"
