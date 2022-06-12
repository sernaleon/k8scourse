appName=p104
dockerUsername=sernalen
image=$dockerUsername/k8scourse-${appName}:latest

set -o xtrace

kubectl delete --all deployments

docker build . -t $image
docker push $image

k3d cluster create -a 2
kubectl config use-context k3d-k3s-default

# main change compared to 1.02
kubectl apply -f manifests/deployment.yaml

kubectl get deployments
kubectl get pods
pod=$( kubectl get pods | grep $appName | awk '{print $1;}' )

sleep 5
kubectl logs -f $pod
