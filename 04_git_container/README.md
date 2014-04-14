# 4. Créer un conteneur git

Le but de cet exercice est de fournir un conteneur contenant un repository git et pouvant être accéder en SSH, afin de pouvoir provisionner rapidement et simplement des repositories Git.

Aidez-vous de la [documentation de référence sur les Dockerfile](http://docs.docker.io/en/latest/reference/builder/)

## a. Installation des packages nécessaires

* Créez un fichier Dockerfile de départ pour votre conteneur.

* Installez les packages nécessaires, `git-core` et `openssh-server` (Vous aurez également besoin de `curl` pour la suite)

* Note : Il est nécessaire de créer le répertoire `/var/run/sshd` pour pouvoir lancer le serveur SSH  


## Accès SSH

* Pour pouvoir accéder au conteneur à distance, via SSH, il faut exposer le port 22

* La commande `/usr/sbin/sshd -D` devra être utilisée commande commande du démarrage du conteneur

Afin de pouvoir accéder plus facilement au serveur git par la suite, nous allons lui fournir une clé publique SSH. Pour cela, nous allons l'ajouter au fichier `/home/git/.ssh/authorized_keys` de notre conteneur.

* Utiliser la clé publique `docker.pub`.

* Ajouter la au fichier `/home/git/.ssh/authorized_keys` de votre image à l'aide de l'instruction [`ADD`](http://docs.docker.io/en/latest/reference/builder/#add)

Pour vérifier que tout fonctionne, connectez vous en SSH au conteneur avec l'utilisateur git, mot de passe git

(vous pouvez aussi copier les fichiers `docker.pub` et `docker` présents dans le répertoire [05_jenkins_container](../05_jenkins_container) dans votre dossier ssh, `~/.ssh` pour pouvoir accéder au conteneur sans rentrer de mote passe).

## b. Configuration Git

Afin d'avoir un repository git fonctionnel sur votre conteneur, un peu de configuration est nécessaire.

* Créez un utilisateur git : `adduser git` avec un mot de passe "simple" : `echo git:git | chpasswd`

* Il est ensuite nécessaire d'initialiser un repository en mode "bare" pour recevoir vos futurs commits. Créez le répertoire de travail `/opt/git/project.git` dans lequel vous exécutez la commande `git init --bare`. Enfin, ne pas oublier de changer le propriétaire de ce répertoire, `chown -R git /opt/git`

## c. Ajout d'un hook Git

Pour vérifier que notre repository fonctionne bien (et parce que nous en aurons également besoin plus tard), nous allons ajouter un `post_receive` hook au repository que nous avons créé

* Dans le répertoire de travail, ajoutez un fichier, qui consistera en un simple script bash qui fera juste `echo`, afin de vérifier que chaque commit appelle bien ce hook

* Ajoutez ce fichier dans `/opt/git/project.git/hooks/post-receive` toujours avec l'instruction `ADD`

* Petite astuce, n'oubliez pas d'ajouter les droits en exécution sur ce fichier, `chmod +x /opt/git/project.git/hooks/post-receive`

## d. Test end-to-end

* Lancez le conteneur que vous venez de créer.

* Pour tester votre conteneur, connectez vous en ssh `ssh git@$CONTENEUR_IP`

* Placez-vous dans un repository git (nous vous conseillons de cloner https://github.com/julienvey/hello-java sur votre hôte)

* Ajoutez un remote correspondant à votre repository créé avec Docker

`$ git remote add docker git@${CONTAINER_IP}:/opt/git/project.git`

* poussez votre code `$ git push docker master`

* Vérifiez dans les logs de la commande `git push` que votre hook a bien été appelé
