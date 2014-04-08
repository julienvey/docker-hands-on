#!/bin/bash

#/etc/init.d/jenkins start
sleep 20
wget http://localhost:8080/jnlpJars/jenkins-cli.jar

#configure update center
wget -O default.js http://updates.jenkins-ci.org/update-center.json
sed '1d;$d' default.js > default.json
curl -X POST -H "Accept: application/json" -d @default.json http://localhost:8080/updateCenter/byId/default/postBack --verbose

#install plugins
java -jar jenkins-cli.jar -s http://localhost:8080/ install-plugin git publish-over-ssh postbuild-task
java -jar jenkins-cli.jar -s http://localhost:8080/ create-job defaultjob < config-job.xml