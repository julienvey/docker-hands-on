# 3. Docker Registry

Dans cet exercice, nous allons nous familiariser avec les concepts du Registry Docker et de l'[index](https://index.docker.io/) (Registry central)

## a. Pull (Registry Central)

* Récupérer l'Image `busybox` depuis le registry central.

## c. Push (Registry Central)

* Publier votre Image, créée lors de l'exercice [02_dockerfile](../02_dockerfile), sur le registry central. Cette étape requiert la création d'un compte sur [index.docker.io](https://index.docker.io/) et de vous authentifier grâce à la commande "docker login".

* Une fois votre image publiée, rendez vous sur [l'index](https://index.docker.io/) pour chercher votre image nouvellement créée

## d. Private Registry

* Démarrer votre propre registry local en utilisant l'image `registry` disponible sur le registry central. Le port 5000 doit être exposé lors de l'exécution du conteneur contenant le registry.

## e. Push (Private Registry)

* Récupérer l'IP du conteneur créé lors de l'étape précédente et publier votre image sur votre registry local. (Astuce: utiliser un tag pour spécifier l'ip et le port du registry avant de faire `push`)
