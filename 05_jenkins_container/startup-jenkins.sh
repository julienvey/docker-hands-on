IP_ADDRESS=$(/sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}')
echo $IP_ADDRESS > jenkins.host
scp -i /var/lib/jenkins/.ssh/id_rsa jenkins.host git@$GIT_PORT_22_TCP_ADDR:/home/git/jenkins.host

sed -i 's/@@GIT_IP@@/'"$GIT_PORT_22_TCP_ADDR"'/g' /var/lib/jenkins/jobs/defaultjob/config.xml
sed -i 's/@@TOMCAT_IP@@/'"$TOMCAT_PORT_8080_TCP_ADDR"'/g' var/lib/jenkins/jenkins.plugins.publish_over_ssh.BapSshPublisherPlugin.xml
etc/init.d/jenkins start
