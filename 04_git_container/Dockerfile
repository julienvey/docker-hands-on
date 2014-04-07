FROM base

# make sure the package repository is up to date
RUN apt-get update

# install Git
RUN apt-get -y install git-core curl

# install ssh
RUN apt-get -y install openssh-server
RUN mkdir /var/run/sshd 

# create ssh-user
RUN adduser git
RUN echo git:git | chpasswd
RUN mkdir /home/git/.ssh
ADD id_rsa.pub /home/git/.ssh/authorized_keys

RUN mkdir /opt/git
RUN mkdir /opt/git/project.git
RUN cd /opt/git/project.git; git init --bare
RUN chown -R git /opt/git
ADD git_post-receive_hook /opt/git/project.git/hooks/post-receive
RUN chmod +x /opt/git/project.git/hooks/post-receive

# run ssh
EXPOSE 22
CMD /usr/sbin/sshd -D