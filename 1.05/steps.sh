appName=p105
dockerUsername=sernalen
tag=100
image=$dockerUsername/k8scourse-${appName}:$tag

set -o xtrace

kubectl delete --all deployments

docker build . -t $image
docker push $image

k3d cluster create -a 2
kubectl config use-context k3d-k3s-default

kubectl apply -f manifests/deployment.yaml

kubectl get deployments
kubectl get pods
pod=$( kubectl get pods | grep $appName | awk '{print $1;}' )

# main change compared to 1.04
kubectl get po
kubectl port-forward $pod 3033:8080

sleep 5
kubectl logs -f $pod
