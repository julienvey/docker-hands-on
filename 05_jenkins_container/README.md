# 5. Jenkins Container
L'objectif de cet exercice est d'écrire un Dockerfile permettant de construire un conteneur Jenkins. Celui-ci permettra d'effectuer le build d'une application web Java en un WAR.  
Attention: L'image de base de votre Dockerfile devra être ubuntu: votre Dockerfile devra donc utiliser la commande `FROM ubuntu`. Si vous utilisez une autre image de base, vous risquez de rencontrer des problèmes lors des prochains exercices.

## a. Installer les packages prérequis

Ajoutez les commandes dans votre Dockerfile permettant d'installer les packages suivants:

* `openjdk-6-jdk`, `git`, `curl`, `maven`, `wget`

## b. Installer Jenkins

* Avant tout, ajoutez le repository jenkins ci-dessous dans vos sources.list
```bash
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
RUN sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN apt-get update
RUN apt-get install -y jenkins
```

* Installez ensuite le package `jenkins`

## c. Accès SSH

* Comme cela a été fait pour [l'exercice 04](../04_git_container#acc%C3%A8s-ssh), nous allons copier les clés SSH dans le répertoire SSH de jenkins

* Il vous faudra cette fois-ci copier également la clé privée, en plus de la clé publique, ainsi que copier le fichier ssh-config fourni. Ce fichier modifie simplement la variable `StrictHostKeyChecking`

```bash
# Copy SSH Key
ADD docker.pub /root/.ssh/id_rsa.pub
ADD docker /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa /root/.ssh/id_rsa.pub
ADD ssh-config /etc/ssh/ssh_config
```

## d. Configurer Jenkins

L'étape suivante consiste à ajouter les jobs Jenkins nécessaires au build de la webapp.  
Cette étape étant difficilement réalisable durant le temps imparti du hands-on, nous vous fournissons les XML, les scripts de configurations et les commandes à ajouter à votre Dockerfile afin d'ajouter les plugins Jenkins et configurer les jobs.

* Téléchargez le fichier [jenkinsconf.tar.gz](https://drive.google.com/file/d/0B17A6PfeKUlxa0JoOGdoSG5taWM/edit), également disponible sur la clé fournie, et placez le dans votre répertoire de travail.
* Nous allons également ajouter le fichier startup-jenkins.sh dans notre conteneur

```bash
# Configure Jenkins
ADD jenkinsconf.tar.gz /root
RUN chmod 700 /root/.jenkins
ADD startup-jenkins.sh /startup.sh
RUN chmod 700 /startup.sh
```

* Finalisez votre Dockerfile en exposant le port 8080 et en utilisant le script de startup rajouté lors de l'étape précédente comme commande de démarrage.

## e. Test

* Vous pouvez désormais exécuter votre conteneur et tester si Jenkins a bien été déployé en vous connectant à l'interface Web (Si vous utilisez Docker dans une VM, n'oubliez pas de faire un mapping du port 8080 entre votre conteneur et la VM hôte)
