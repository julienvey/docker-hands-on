# 6. Lier deux conteneurs

Maintenant que nous avons notre conteneur git et notre conteneur Jenkins, nous allons les lier entre eux.

Le but de cet exercice est de produire l'environnement pour réaliser le workflow suivant:
- 'git push' sur le conteneur git
- un hook git notifie jenkins et déclenche un job sur le conteneur jenkins
- le conteneur jenkis pull le repository git
- jenkins build l'application et génère un war

## a. Script

* Créez un script bash, nommé par exemple runstack.sh


## b. conteneur Git

* Dans le répertoire de votre conteneur Git, modifiez le hook. Celui-ci va maintenant notifier le conteneur jenkins à chaque push sur le repo. Voici le script bash :

```
#!/bin/bash

IP_ADDRESS=$(cat /home/git/jenkins.host)
curl http://$IP_ADDRESS:8080/job/defaultjob/build
```

Nous verrons juste après pourquoi nous utilisons `$(cat /home/git/jenkins.host)`


* Dans votre script, instanciez un conteneur git en mode daemon

* Récupérez l'adresse IP de votre conteneur avec la commande [`inspect`](http://docs.docker.io/en/latest/reference/commandline/cli/#inspect)

## c. Hack bidirectionnalité

Dans la suite de cet exercice, nous allons utiliser les [`link`](http://docs.docker.io/en/latest/use/working_with_links_names/) de Docker.

Malheureusement les links docker sont unidirectionnels. Hors dans notre workflow, nous avons besoin que les deux conteneurs se connaissents. Git doit connaître jenkins pour trigger le build du job via le hook. Et jenkins a besoin de connaître Git pour pouvoir faire un pull du code source. Nous allons donc devoir modifier quelque peu nos conteneurs et notre script pour prendre en compte cette contrainte

Ajoutez ce code bash à votre script

```
HOST_FILE=/tmp/jenkins.host
echo $JENKINS_IP > $HOST_FILE
scp $HOST_FILE git@$GIT_IP:/home/git/jenkins.host
```

Cela va permettre d'injecter l'adresse IP de Jenkins dans le conteneur Git.

## d. conteneur Jenkins

* Dans votre script, instanciez un conteneur jenkins en le liant avec le conteneur Git que vous venez de créer précédemment, avec l'instruction [`link`](http://docs.docker.io/en/latest/use/working_with_links_names/) en utilisant l'alias `git`.

## e. Afficher les informations de connection.

* Afin de pouvoir vous connecter à vos conteneurs, afficher leur adresses en sortie de votre script. Par exemple :

```
echo "Git repository available at ssh://git@$GIT_IP/opt/git/project.git password : git\n"
echo "Jenkins available at $JENKINS_IP:8080"
```

## f. Test end-to-end

* Tout d'abord vérifiez que vous pouvez vous connecter à votre conteneur Jenkins, et vérifiez qu'un job default existe bien.

* Ajoutez l'url du conteneur git en tant que remote sur votre repository local

```
$ git remote add docker $GIT_URL
```

* Poussez votre code avec `git push`

* Vérifiez que votre instance de Jenkins est en train de builder votre application.

Voilà, vous pouvez désormais lancer autant d'instances d'usines logicielles que vous le souhaitez, avec un simple script bash `runstack.sh`
