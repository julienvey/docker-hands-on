# 4. Créer un conteneur git

Le but de cet exercice est de fournir un conteneur contenant un repository git et pouvant être accéder en SSH, afin de pouvoir provisionner rapidement et simplement des repositories Git.

## a. Installation des packages nécessaires 

* Créez un Dockerfile de départ pour votre conteneur.

* Installez les packages nécessaires, git-core et openssh-server

## Accès SSH

* Pour pouvoir accéder au conteneur à distance, via SSH, il faut exposer le port 22

* La commande `/usr/sbin/sshd -D` devra être utilisée commande commande du démarrage du conteneur

Afin de pouvoir accéder plus facilement au serveur git, nous allons lui fournir notre clé publique SSH. Pour cela, nous allons l'ajouter au fichier `/home/git/.ssh/authorized_keys` de notre conteneur.

* Copier votre clé publique SSH dans le répertoire de travail de votre conteneur git.

* Ajouter la au fichier `/home/git/.ssh/authorized_keys` de votre image à l'aide de l'instruction [`ADD`](http://docs.docker.io/en/latest/reference/builder/#add)

Pour vérifier que tout fonctionne, connectez vous en SSH au conteneur avec l'utilisateur git, sans avoir à rentrer de mot de passe.

## b. Configuration Git

Afin d'avoir un repository git fonctionnel sur votre conteneur, un peu de configuration est nécessaire.

* Créez un utilisateur git : `adduser git` avec un mot de passe "simple" : `echo git:git | chpasswd`

* Il est ensuite nécessaire d'initialiser un repository en mode "bare" pour recevoir vos futurs commits. Créez le répertoire de travail `/opt/git/project.git` dans lequel vous exécutez la commande `git init --bare`. Enfin, ne pas oublier de changer le propriétaire de ce répertoire, `chown -R git /opt/git`

## c. Ajout d'un hook Git

Pour vérifier que notre repository fonctionne bien (et parce que nous en aurons également besoin plus tard), nous allons ajouter un `post_receive` hook au repository que nous avons crée

* Dans le répertoire de travail, ajouter un fichier, qui consistera en un simple script bash qui fera un simple `echo`, afin de vérifier que chaque commit appelle bien ce hook

* Ajouter ce fichier dans `/opt/git/project.git/hooks/post-receive` toujours avec l'instruction `ADD`

* Petite astuce, n'oubliez pas d'ajouter les droits en exécution sur ce fichier, `chmod +x /opt/git/project.git/hooks/post-receive`

## d. Test end-to-end

* Lancez le conteneur que vous venez de créer.

* Dans un repository git quelconque, ajoutez un remote correspondant à votre repository ainsi créé `$ git remote add git@github.com:julienvey/docker-hands-on.git`

* poussez votre code `$ git push`

* Vérifiez dans les logs du conteneur (avec la command [`logs`](http://docs.docker.io/en/latest/reference/commandline/cli/#logs)) que votre hook a bien été appelé















