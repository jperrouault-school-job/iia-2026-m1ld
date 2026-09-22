# Voir la liste des containers actifs
docker ps

# Voir la liste de tous les containers
docker ps -a

# Démarrer un nouveau container
docker run image:tag

# Démarrer un nouveau container avec binding de port
docker run -p port_local:port_container image:tag

# Démarrer un nouveau container avec binding de port, en arrière-plan
docker run -d -p port_local:port_container image:tag

# Démarrer un nouveau container avec binding de port, en arrière-plan et un nom
docker run -d -p port_local:port_container --name le-nom image:tag

# Supprimer un container
docker rm nom-container
docker rm id-container

# Supprimer un container démarré
docker stop nom-container
docker stop id-container
docker rm nom-container
docker rm id-container

# OU
docker rm nom-container -f
docker rm id-container -f

# Démarrer un container existant
docker start nom-container
docker start id-container

# Arrêter un container
docker stop nom-container
docker stop id-container

# Redémarrer un container
docker restart nom-container
docker restart id-container

# Copier un fichier de la machine vers un container
docker cp chemin/vers/fichier-source.txt nom-container:/chemin/vers/destination.txt

# Copier un fichier d'un container vers la machine
docker cp nom-container:/chemin/vers/fichier-source.txt chemin/vers/destination.txt

# Démarrer un nouveau container avec binding de port, en arrière-plan, un nom et un mapping de volume
docker run -d -p port_local:port_container --name le-nom -v chemin/vers/source:/chemin/vers/destination image:tag

# Créer un réseau
docker network create nom-rso

# Voir la liste des réseaux
docker network ls

# Connecter un container au réseau
docker network connect nom-rso nom-container

# Déconnecter un container du réseau
docker network disconnect nom-rso nom-container

# Supprimer un réseau
docker network rm nom-rso

# Récupérer une image
docker pull nom-image

# Envoyer une image au Registry
docker push nom-image

# Voir la liste des images
docker image ls
docker images

# Supprimer une image
docker image rm nom-image
docker rmi nom-image

# Voir la liste des volumes
docker volume ls

# Créer un volume
docker volume create nom-volume

# Supprimer un volume
docker volume rm nom-volume
