#!/usr/bin/env sh

GIT_ID=$(docker run -d git)
GIT_IP=$(docker inspect --format='{{.NetworkSettings.IPAddress}}' $GIT_ID)
GIT_NAME=$(docker inspect --format='{{.Name}}' $GIT_ID | cut -c 2-)
HOST_FILE=/tmp/jenkins.host
JENKINS_ID=$(docker run -p 8080 --link $GIT_NAME:git -d jenkins)
JENKINS_IP=$(docker inspect --format='{{.NetworkSettings.IPAddress}}' $JENKINS_ID)
JENKINS_PORT=$(docker port $JENKINS_ID 8080)
echo $JENKINS_IP > $HOST_FILE
scp $HOST_FILE git@$GIT_IP:/home/git/jenkins.host
echo "\nGit repository available at ssh://git@$GIT_IP/opt/git/project.git password : git"
echo "Jenkins available at $JENKINS_IP:8080 or on $JENKINS_PORT"
