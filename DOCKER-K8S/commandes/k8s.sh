# Voir la liste des worker nodes
kubectl get nodes
kubectl get no

# Voir la liste des pods
kubectl get pods
kubectl get po

# Créer un nouveau déploiement
kubectl create deployment nom-app --image=image-docker:tag

# Voir la liste des déploiements
kubectl get deployments
kubectl get deploy

# Créer un Service de type LoadBalancer
kubectl expose deployment nom-app --type=LoadBalancer --port=8080 --target-port=port-app

# Voir la liste des services
kubectl get services
kubectl get svc

# Supprimer un Service
kubectl delete service nom-service

# Créer un Ingress
# -> Créer un Service de type ClusterIP
kubectl expose deployment nom-app --type=ClusterIP --port=8080 --target-port=port-app

# -> Créer un Ingress
kubectl create ingress jhtml-nginx --rule="html-nginx.localhost/*=jhtml-nginx:8080"

# Voir la liste des Ingress
kubectl get ingresses
kubectl get ing

