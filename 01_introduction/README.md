# 0. Installation

Avant tout, installer Docker en vous référant aux [informations de la documentation Docker](http://docs.docker.io/en/latest/installation/)

# 1. Introduction

Pour les exercices suivants, aidez-vous de la [documentation en ligne de Docker](http://docs.docker.io/en/latest/reference/commandline/)

## a. Hello World

Lancer un conteneur qui affiche "Hello World" à l'aide de la commande echo

## b. Mode interactif

Lancer un conteneur Docker en mode interactif puis installer le package redis-server.

## c. Commit

Sauvegarder l'état du conteneur dans une image Docker.  
Lister les images afin de vérifier que votre image a bien été sauvegardée.

## d. Mode détaché (deamon)

Lancer un conteneur à partir de votre image créée préalablement. Celui-ci devra être executé en mode daemon. (Astuce: voir options commande [`run`](http://docs.docker.io/en/latest/reference/commandline/cli/#run)) avec comme commande de démarrage `/usr/bin/redis-server`
Lister les processus docker en cours d'executions afin de vérifier que le conteneur est bien en cours d'exécution en arrière-plan.

## e. Inspection

Récupérer les informations réseaux du conteneur et extraire les informations suivantes: IP / Ports.
Quelles remarques pouvez-vous faire concernant le port ?  
Vous pouvez désormais supprimer votre conteneur.

## f. Port Mapping

Exécuter un nouveau conteneur à partir de votre Image redis mais cette fois-ci il faudra exposer le port 6379 (Astuce: [voir option commande `run`](http://docs.docker.io/en/latest/reference/run/)). Le conteneur devra également être exécuté en mode daemon.  
Inspecter le conteneur dans le but de récupérer son IP et tester le serveur redis depuis votre machine local : `redis-cli -h <CONTAINER_IP> ping`

(astuce : la commande `redis-cli` est disponible dans le package `redis-server`)
