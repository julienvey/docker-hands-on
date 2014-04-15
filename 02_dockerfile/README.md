# 2. Automatiser, Automatiser....

Le but cet exercice est d'automatiser tout ce qui a été fait dans l'exercice précédent.
Pour cela Docker fournit les [**DockerFile**](http://docs.docker.io/en/latest/reference/builder/)

## a. Hello World... again

* Créez un répertoire de travail pour cet exercice et un fichier *Dockerfile* à la racine de celui-ci.

Deux instructions seulement sont nécessaires pour reproduire l'exemple Hello World.

* Définissez l'image source de votre conteneur avec l'instruction `FROM`. Pour cet exercice, vous pouvez utiliser de nouveau l'image source `julienvey/fullubuntu`

* Déclarez la commande `echo 'Hello World'` avec l'instruction `CMD` ou `ENTRYPOINT` ([voir la différence entre les deux instructions](http://stackoverflow.com/questions/21553353/what-is-the-difference-between-cmd-and-entrypoint-in-a-dockerfile?answertab=active#tab-top))

* Il ne reste plus qu'à construire son conteneur avec la commande [`build`](http://docs.docker.io/en/latest/reference/commandline/cli/#build)

Le résultat de la commande build est l'idenfiant du conteneur créé.

* Pour tester si votre conteneur a le comportement souhaité, démarrez le avec la commande [`run`](http://docs.docker.io/en/latest/reference/commandline/cli/#run)

## b. Exécution d'instructions

* Au sein du Dockerfile, installer le package redis-server avec l'instruction `RUN` (ne pas oublier de mettre à jour la liste des packages de la distribution)

* Remplacez la commande `echo 'Hello World'` par `/usr/bin/redis-server` pour démarrer votre service redis au démarrage du conteneur

* Exposez le port 6379 pour pouvoir accéder au serveur redis

## c. Vérification du service rendu

* Exécutez la commande `docker build` de nouveau

* Démarrez un nouveau conteneur (en mode daemon)à partir de l'image qui vient d'être généré

* Vérifiez que vous avez bien accès au service redis sur le conteneur avec la commande `redis-cli` (pour cela, il vous faudra trouver le bon numéro de port)
