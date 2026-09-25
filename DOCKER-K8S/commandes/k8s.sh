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

# Supprimer un Pod
kubectl delete pod nom-pod

# Scaler un Deployement
kubectl scale deployment nom-app --replicas=N
kubectl scale deploy nom-app --replicas=N

# Mettre à jour l'image d'un Deployement
kubectl set image deploy nom-app nom-app=nouvelle-image:tag

# Voir le status du déploiement
kubectl rollout status deploy nom-app

# Redémarrer un déploiement
kubectl rollout restart deploy nom-app

# Pour appliquer un Manifest
 kubectl apply -f /chemin/vers/fichier-manifest.yaml

# Supprimer un Manifest
 kubectl delete -f /chemin/vers/fichier-manifest.yaml

# Exécuter une commande dans un pod
kubectl exec -it nom-pod -- commande
