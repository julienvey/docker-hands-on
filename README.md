# Hands On Docker

Ce Hands On a pour vocation de vous faire manipuler Docker. Tout d'abord en apprenant quelques bases, pour ensuite mettre en place sa propre usine logicielle de manière automatisée.

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
