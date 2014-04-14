FROM ubuntu
MAINTAINER Pierre Padrixe "pierre.padrixe@numergy.com"

#net-tools for ifconfig, software-props for add-apt-repository
RUN apt-get install -y software-properties-common python-software-properties net-tools

# Install oracle JDK 7 repository
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update

# Pre-accept licence agreement
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

RUN apt-get install -y oracle-java7-installer git curl maven

# Install Jenkins
RUN apt-get install -y wget
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
RUN sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN apt-get update
RUN apt-get install -y --force-yes jenkins

# Generate SSH Key
RUN mkdir /var/lib/jenkins/.ssh/
#ADD id_rsa.pub /root/.ssh/id_rsa.pub
#ADD id_rsa /root/.ssh/id_rsa
ADD id_rsa.pub /root/.jenkins/.ssh/id_rsa.pub
ADD id_rsa /root/.jenkins/.ssh/id_rsa
RUN chmod 600 /root/.jenkins/.ssh/id_rsa.pub /root/.jenkins/.ssh/id_rsa
ADD ssh-config /etc/ssh/ssh_config

# Configure Jenkins
ADD jenkinsconf.tar.gz /root
RUN chmod 700 /root/.jenkins
ADD startup-jenkins.sh /startup.sh
RUN chmod 700 /startup.sh

EXPOSE 8080

CMD /startup.sh
