# Jenkins
#
# VERSION	0.0.1

FROM base
MAINTAINER Julien Vey "julien.vey@numergy.com"

# Necessary to add the ppa
RUN apt-get install -y software-properties-common

# Install oracle JDK 7 repository
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update

# Pre-accept licence agreement
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

# Install JDK
RUN apt-get install -y oracle-java7-installer

# Install tools needed
RUN apt-get install -y git
RUN apt-get install -y curl
RUN apt-get install -y maven

# Install Jenkins

RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
RUN sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN sudo apt-get update

# Workaround due to a bug in last version of jenkins (seen 7 nov 2013)
# see https://issues.jenkins-ci.org/browse/JENKINS-20407
RUN mkdir /var/run/jenkins

RUN sudo apt-get install -y jenkins

# Configure Jenkins
ADD config-jenkins.sh config.sh
ADD config-job.xml config-job.xml
RUN chmod +x config.sh
RUN ./config.sh

# Generate SSH Key
RUN mkdir /var/lib/jenkins/.ssh/
# RUN ssh-keygen -t rsa -f /var/lib/jenkins/.ssh/id_rsa -N ''
ADD docker.pub /var/lib/jenkins/.ssh/id_rsa.pub
ADD docker /var/lib/jenkins/.ssh/id_rsa
RUN chown jenkins /var/lib/jenkins/.ssh/id_rsa
RUN chown jenkins /var/lib/jenkins/.ssh/id_rsa.pub

ADD ssh-config /etc/ssh/ssh_config

ADD hudson.tasks.Maven.xml /var/lib/jenkins/hudson.tasks.Maven.xml
ADD jenkins.plugins.publish_over_ssh.BapSshPublisherPlugin.xml /var/lib/jenkins/jenkins.plugins.publish_over_ssh.BapSshPublisherPlugin.xml
ADD startup-jenkins.sh /startup.sh
RUN chmod +x /startup.sh

EXPOSE 8080
CMD /startup.sh; tail -f /var/log/jenkins/jenkins.log
