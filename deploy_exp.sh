#!/bin/bash

IMAGE=tecor/config-testing:latest
APP=config-testing

SHARED=/tmp/testing_report
SUT=xwiki-platform
DOCKERGID=998

NUMBER_OF_CONFIGS=$1

TIME_MEASURED=/tmp/tecor_tmeasured/result_${NUMBER_OF_CONFIGS}
echo "Creating ${TIME_MEASURED}"
mkdir -p $TIME_MEASURED

echo "Copying SUT"
rm -rf ./$SUT
cp -R ../$SUT .

rm -rf $HOME/$SHARED
#docker stop $APP
#docker rm $APP
#docker rmi -f $IMAGE
#docker build --rm -t $IMAGE .

NUMBER_OF_CONFIGS=$1

for (( i = 0; i < 1; i++ )); do
	START=$(date +%s.%N)
	#docker run -v /var/run/docker.sock:/var/run/docker.sock -v $HOME/$SHARED:/var/jenkins_home/report/ -e MASTER_SSH_PORT=22 -e MASTER_SLAVE_USER=jenkins -e MASTER_SLAVE_PWD=jenkins -e DOCKER_GID=$DOCKERGID --name $APP $IMAGE
	sleep 1
	END=$(date +%s.%N)
	DIFF=$(echo "$END - $START" | bc)
	echo "Tested $NUMBER_OF_CONFIGS configs in $DIFF sec" | tee -a $TIME_MEASURED/output_${i}
done
