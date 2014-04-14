# 5. Jenkins Container
L'objectif de cet exercice est d'écrire un Dockerfile permettant de construire un conteneur Jenkins. Celui-ci permettra d'effectuer le build d'une application web Java en un WAR.  
Attention: L'image de base de votre Dockerfile devra être ubuntu: votre Dockerfile devra donc utiliser la commande `FROM ubuntu`. Si vous utilisez une autre image de base, vous risquez de rencontrer des problèmes lors des prochains exercices.

## a. Installer les packages prérequis

Ajouter les commandes dans votre Dockerfile permettant d'installer les packages suivants:

* Le package Java: soit openjdk, soit le jdk d'Oracle (oracle-java7-installer) disponible dans le repository ppa:webupd8team/java (add-apt-repository ppa:webupd8team/java)

* Les package git, curl, maven, wget


## b. Installer Jenkins
Ajouter la commande permettant d'installer le package Jenkins

* Au préalable, ajouter le repository jenkins ci-dessous dans vos sources.list
```bash
RUN apt-get install -y wget
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
RUN sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN apt-get update
RUN apt-get install -y --force-yes jenkins
```

* Vous pouvez désormais installer le package jenkins

## c. Accès SSH

* Configurer les accès comme cela a été fait pour [l'exercice 04](../04_git_container#acc%C3%A8s-ssh)

* Il vous faudra cette fois-ci copier également la clé privée, en plus de la clé publique de l'exercice 04, ainsi que copier le fichier ssh-config fourni. Ce fichier modifie simplement la variable `StrictHostKeyChecking`

```bash
# Generate SSH Key
RUN mkdir /var/lib/jenkins/.ssh/
ADD id_rsa.pub /root/.jenkins/.ssh/id_rsa.pub
ADD id_rsa /root/.jenkins/.ssh/id_rsa
RUN chmod 600 /root/.jenkins/.ssh/id_rsa.pub /root/.jenkins/.ssh/id_rsa
ADD ssh-config /etc/ssh/ssh_config
```

## d. Configurer Jenkins

L'étape suivante consiste à ajouter les jobs Jenkins nécessaires au build de la webapp.  
Cette étape étant difficilement réalisable durant le temps imparti du hands-on, nous vous fournissons les XML, les scripts de configurations et les commandes à ajouter à votre Dockerfile afin d'ajouter les plugins Jenkins et configurer les jobs.

Téléchargez [ce fichier](https://drive.google.com/file/d/0B17A6PfeKUlxa0JoOGdoSG5taWM/edit) et placez le dans votre répertoire de travail.

```bash
# Configure Jenkins
ADD jenkinsconf.tar.gz /root
RUN chmod 700 /root/.jenkins
ADD startup-jenkins.sh /startup.sh
RUN chmod 700 /startup.sh
```

* Finaliser votre Dockerfile sachant que le port 8080 doit être exposé et que le script de startup a déjà été rajouté lors de l'étape précédente.

## e. Test

* Vous pouvez désormais exécuter votre conteneur et tester si Jenkins a bien été déployé en vous connectant à l'interface Web (Si vous utilisez Docker dans une VM, il sera surement nécessaire de faire de la redirection de port)
