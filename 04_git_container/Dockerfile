FROM base

# Install Git
RUN apt-get update
RUN apt-get -y install git-core curl

# Install ssh
RUN apt-get -y install openssh-server
RUN mkdir /var/run/sshd

# Create ssh-user
RUN adduser git
RUN echo git:git | chpasswd
RUN mkdir /home/git/.ssh
ADD docker.pub /home/git/.ssh/authorized_keys

RUN mkdir /opt/git
RUN mkdir /opt/git/project.git
RUN cd /opt/git/project.git; git init --bare
RUN chown -R git /opt/git
ADD git_post-receive_hook /opt/git/project.git/hooks/post-receive
RUN chmod +x /opt/git/project.git/hooks/post-receive

# run ssh
EXPOSE 22
CMD /usr/sbin/sshd -D
