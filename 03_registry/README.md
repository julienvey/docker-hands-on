3. Docker Registry
====================

a. Pull (Registry Central)
---------------------
Récupérer l'Image "busybox" depuis le registry central.

c. Push (Registry Central)
---------------------
Publier votre Image, créée lors de l'exercice [02_dockerfile](https://github.com/julienvey/docker-hands-on/tree/master/02_dockerfile), sur le registry central. Cette étape requiert la création d'un compte sur [index.docker.io](https://index.docker.io/) et de vous authentifier grâce à la commande "docker login".

d. Private Registry
---------------------
Créer votre propre registry local en utilisant l'Image "samalba/docker-registry" disponible sur le registry central. Le port 5000 doit être exposé lors de l'exécution du Container contenant le registry.

c. Push (Private Registry)
---------------------
Récupérer l'IP du Container créé lors de l'étape précédente et publier votre Image sur votre registry local. (Astuce: utiliser tag avant de push)
