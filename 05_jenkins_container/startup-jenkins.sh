sed -i 's/@@GIT_IP@@/'"$GIT_PORT_22_TCP_ADDR"'/g' /root/.jenkins/jobs/defaultjob/config.xml
java -jar /usr/share/jenkins/jenkins.war
