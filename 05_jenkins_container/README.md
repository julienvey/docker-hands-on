# 5. Jenkins Container
L'objectif de cet exercice est d'écrire un Dockerfile permettant de construire un conteneur Jenkins. Celui-ci permettra d'effectuer le build d'une application web Java en un WAR.  
Attention: L'image de base de votre Dockerfile devra être ubuntu: votre Dockerfile devra donc utiliser la commande "FROM ubuntu". Si vous utilisez une autre image de base, vous risquez de rencontrer des problèmes lors des prochains exercices.

## a. Installer les packages prérequis

Ajouter les commandes dans votre Dockerfile permenttant d'installer les packages suivants:

* Le package Java: soit openjdk, soit le jdk d'Oracle (oracle-java7-installer) disponible dans le le repository ppa:webupd8team/java (add-apt-repository ppa:webupd8team/java) 

* Les package git, curl, maven, wget


## b. Installer Jenkins
Ajouter la commande permettant d'installer le package Jenkins

* Au préalable, ajouter le repository jenkins-ci dans vos sources.list
```shell
RUN \
    wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add - ;\
    sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list' ;\
    apt-get update ;\

    # Workaround due to a bug in last version of jenkins (seen 7 nov 2013)
    # see https://issues.jenkins-ci.org/browse/JENKINS-20407
    mkdir /var/run/jenkins
#RUN
```

* Vous pouvez désormais installer le package jenkins

## c. Accès SSH
Configurer les accès comme cela a été fait pour [l'exercice 03](julienvey/docker-hands-on/tree/master/04_git_container#acc%C3%A8s-ssh) 

## d. Configurer Jenkins
L'étape suivante consiste à ajouter les jobs Jenkins nécessaires au build de la webapp.  
Cette étape étant difficilement réalisable durant le temps imparti du hands-on, nous vous fournissons les XML, les scripts de configurations et les commandes à ajouter à votre Dockerfile afin d'ajouter les plugins et jobs Jenkins.

```shell
# Configure Jenkins
ADD config-jenkins.sh config.sh
ADD config-job.xml config-job.xml
RUN chmod +x config.sh
RUN ./config.sh

ADD hudson.tasks.Maven.xml /var/lib/jenkins/hudson.tasks.Maven.xml
ADD jenkins.plugins.publish_over_ssh.BapSshPublisherPlugin.xml /var/lib/jenkins/jenkins.plugins.publish_over_ssh.BapSshPublisherPlugin.xml
ADD startup-jenkins.sh /startup.sh
RUN chmod +x /startup.sh
```

* Finaliser votre Dockerfile sachant que le port 8080 doit être exposé et que le script de startup a déjà été rajouté lors de l'étape précédente.

## e. Test
* Vous pouvez désormais exécuter votre conteneur et tester si Jenkins a bien été déployé.

* Lancer le job jenkins pour tester si le build de la webapp est bien fonctionnel
