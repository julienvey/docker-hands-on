1. Introduction
====================

a. Hello World
---------------------
Exécuter le processus echo afin d'afficher "Hello World" dans un Container Docker.

b. Mode Interactif
---------------------
Exécuter un Container Docker en mode interactif puis installer le package redis-server.

c. Commit
---------------------
Sauvegarder l'état du Container dans une Image Docker.  
Lister les images afin de vérifier que votre image a bien été créé.

d. Mode Daemon
---------------------
Exécuter un Container à partir de votre Image créée préalablement, celui-ci devra être executé en mode daemon. (Astuce: voir option commande run)  
Lister les processus docker en cours d'executions afin de vérifier que le container est bien executé en mode daemon.

e. Inspection
---------------------
Récupérer les informations réseau du Container et extraire les informations suivantes: IP / Ports.  
Quelles remarques pouvez-vous faire concernant le port ?  
Vous pouvez désormais supprimer votre container.

f. Port Mapping
---------------------
Exécuter un nouveau Container à partir de votre Image redis mais cette fois-ci il faudra exposer le port 6379 (Astuce: voir option commande run). Le Container devra également être exécuté en mode daemon.  
Inspecter le Container dans le but de récupérer son IP et tester le serveur redis depuis votre machine local : "redis-cli -h <CONTAINER_IP> ping"
