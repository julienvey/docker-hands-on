FROM ubuntu
MAINTAINER Pierre Padrixe "pierre.padrixe@numergy.com"

RUN apt-get update
RUN apt-get install -y openjdk-7-jre git curl maven

# Install Jenkins
RUN apt-get install -y wget
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
RUN sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN apt-get update
RUN apt-get install -y --force-yes jenkins

# Copy SSH Key
ADD docker.pub /root/.jenkins/.ssh/id_rsa.pub
ADD docker /root/.jenkins/.ssh/id_rsa
RUN chmod 600 /root/.jenkins/.ssh/id_rsa.pub /root/.jenkins/.ssh/id_rsa
ADD ssh-config /etc/ssh/ssh_config

# Configure Jenkins
ADD jenkinsconf.tar.gz /root
RUN chmod 700 /root/.jenkins
ADD startup-jenkins.sh /startup.sh
RUN chmod 700 /startup.sh

EXPOSE 8080

CMD /startup.sh
