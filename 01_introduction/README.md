# 0. Installation

Installez Docker en vous référant aux [informations de la documentation Docker](http://docs.docker.io/en/latest/installation/)

# 1. Introduction

Pour les exercices suivants, aidez-vous de la [documentation en ligne de Docker](http://docs.docker.io/en/latest/reference/commandline/)

## a. Hello World

Démarrez le conteneur de l'image `base` qui affiche "Hello World" à l'aide de la commande `echo`.

## b. Mode interactif

Démarrez un conteneur Docker en mode interactif puis installez le package `redis-server`.

## c. Commit

Sauvegardez l'état du conteneur dans une image Docker.  
Listez les images afin de vérifier que votre image a bien été sauvegardée.

## d. Mode détaché (deamon)

Démarrez un conteneur à partir de votre image créée préalablement. Celui-ci devra être executé en mode daemon. (Astuce: voir options commande [`run`](http://docs.docker.io/en/latest/reference/commandline/cli/#run)) avec comme commande de démarrage `/usr/bin/redis-server`
Listez les processus docker en cours d'executions afin de vérifier que le conteneur est bien en cours d'exécution en arrière-plan.

## e. Inspection

Récupérez les informations réseaux du conteneur et extraire les informations suivantes: IP / Ports.
Quelles remarques pouvez-vous faire concernant le port ?  
Vous pouvez désormais supprimer votre conteneur.

## f. Port Mapping

Exécutez un nouveau conteneur à partir de votre Image redis mais cette fois-ci il faudra exposer le port 6379 et le binder sur un port de votre host (Astuce: [voir option commande `run`](http://docs.docker.io/en/latest/reference/run/)). Le conteneur devra également être exécuté en mode daemon.  
Inspecter le conteneur dans le but de récupérer son IP et tester le serveur redis depuis votre machine local : `redis-cli -h <CONTAINER_IP> ping`

(astuce : la commande `redis-cli` est disponible dans le package `redis-server`)
