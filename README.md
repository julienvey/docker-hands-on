# Hands On Docker

Ce Hands On a été créé par [Julien Vey](https://twitter.com/julienvey) et [Pierre Padrixe](https://twitter.com/undefd) dans le cadre du Hands On Docker pour [Devoxx France](http://cfp.devoxx.fr/devoxxfr2014/talk/YCD-250/Votre%20livrable%20avec%20Docker,%20en%20prod%20d%C3%A8s%20demain%20!)

Il a pour vocation de vous faire manipuler Docker. Tout d'abord en apprenant quelques bases, pour ensuite mettre en place sa propre usine logicielle de manière automatisée.

## Installation de l'environnement

Afin de limiter les accès wifi lors de ce Hands On, nous vous fournissons la plupart des éléments nécessaires sur clé USB. Vous trouvez donc de quoi...

* Installer VirtualBox
* Installer Vagrant

Une fois ces deux éléments installés... Nous fournissons une box de base pour vagrant, qui contient Docker déjà installé, ainsi qu'un certain nombre d'images Docker pré-téléchargées.

* Ajouter la box vagrant

```bash
$ vagrant box add docker docker-hands-on.box
```

* Dans un répertoire de travail, créez un fichier Vagrantfile identique à [celui fournit](https://github.com/julienvey/docker-hands-on/blob/master/Vagrantfile), ou alors clonez ou copier le répertoire de sources (celui-ci même)
* Placez vous dans ce répertoire et...

```bash
$ vagrant up
$ vagrant ssh
```

Vous êtes maintenant loggué sur votre VM et le Hands On peut commencer.

Note : Si vous avez lancé vagrant depuis le répertoire des sources, il sera automatiquement monté sur la VM dans /vagrant.
Note2 : L'adresse IP de la machine est 192.168.29.100

## Les bases de Docker

Avant de passer à un exemple concret, il est nécessaire de connaître quelques commandes et quelques notions. Ces trois premières étapes servent donc de "mise en jambe" pour la partie suivante

[Step 1 - Introduction](01_introduction/)

[Step 2 - Dockerfile](02_dockerfile/)

[Step 3 - Registry](03_registry/)

## Automatiser la mise en place de son usine logicielle

Le but de ce Hands On est donc d'automatiser la mise en place d'une usinge logicielle. Pour cela vous devrez au final lancer un unique script bash (de quelques lignes) qui vous permettra de construire l'architecture décrite sur le schéma suivant.

![](assets/jenkins-worflow.png)

Pour réaliser cela, nous allons commencer par construire les conteneur dont nous avons besoin, un qui contiendra un repository Git standalone, et un autre conteneur pour Jenkins.

La suite consistera à utiliser les mécanismes de Docker pour faire se parler entre eux ces deux conteneurs.

Le but final étant qu'un `push` git sur le repository contenu dans le conteneur déclenche un build jenkins qui produit un conteneur Docker contenant notre application déjà packagée avec son serveur d'application.

[Step 4 - Conteneur Git](04_git_container/)

[Step 5 - Conteneur Jenkins](05_jenkins_container/)

[Step 6 - Links](06_links/)

[Step 7 - Docker in Docker](07_docker_in_docker/)

[Step 8 - Connecter un registry](01_connect_the_registry/)
