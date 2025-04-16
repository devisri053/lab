@echo off
REM Set working directory to app and build Docker image
cd app
echo Building Docker image...
docker build -t devisri053/devi-register:latest .

echo Pushing image to Docker Hub...
docker push devisri053/devi-register:latest

cd ..
echo Deploying to Kubernetes...
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

echo Waiting for pods to be ready...
kubectl wait --for=condition=ready pod -l app=devi-register --timeout=60s

echo Launching service in browser...
minikube service devi-register-service
