appName=p103
dockerUsername=sernalen
image=$dockerUsername/k8scourse-${appName}:latest

docker build . -t $image
docker push $image

k3d cluster create -a 2
kubectl config use-context k3d-k3s-default

##main changed compared to 1.01
kubectl apply -f manifests/deployment.yaml

kubectl get deployments
kubectl get pods
pod=$( kubectl get pods | grep $appName | awk '{print $1;}' )
echo $pod
kubectl logs -f $pod
