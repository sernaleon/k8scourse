appName=p108
dockerUsername=sernalen
tag=100
image=$dockerUsername/k8scourse-${appName}:$tag

set -o xtrace

k3d cluster delete
k3d cluster create --port 8082:30080@agent:0 -p 8081:80@loadbalancer --agents 2

docker build . -t $image
docker push $image

kubectl apply -f manifests/

pod=$( kubectl get pods | grep $appName | awk '{print $1;}' )

while : ; do
    state=$( kubectl get pods | grep $appName | awk '{print $3;}' )
    [[ $state != "Running" ]] || break
    sleep 5
done

kubectl get deployments
kubectl get pods
kubectl get svc,ing
kubectl logs $pod
