#!/usr/bin/env sh

GIT_ID=$(docker run -name gitautodeploy -d numergy/git)
GIT_IP=$(docker inspect $GIT_ID | grep IPAddress | cut -d '"' -f 4)
HOST_FILE=/tmp/jenkins.host
JENKINS_ID=$(docker run -link gitautodeploy:git -privileged -d numergy/jenkins)
JENKINS_IP=$(docker inspect $JENKINS_ID | grep IPAddress | cut -d '"' -f 4)
echo $JENKINS_IP > $HOST_FILE
scp $HOST_FILE git@$GIT_IP:/home/git/jenkins.host
echo "\nGit repository available at ssh://git@$GIT_IP/opt/git/project.git password : git"
echo "Jenkins available at $JENKINS_IP:8080"
