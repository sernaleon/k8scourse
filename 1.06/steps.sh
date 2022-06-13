appName=p106
dockerUsername=sernalen
tag=100
image=$dockerUsername/k8scourse-${appName}:$tag

set -o xtrace

k3d cluster delete

#we now open port 8082
k3d cluster create --port 8082:30080@agent:0 -p 8081:80@loadbalancer --agents 2

docker build . -t $image
docker push $image

kubectl apply -f manifests/deployment.yaml

# main change compared to previous version, in opens port 30080 
kubectl apply -f manifests/service.yaml

kubectl get deployments
kubectl get pods

pod=$( kubectl get pods | grep $appName | awk '{print $1;}' )

while : ; do
    state=$( kubectl get pods | grep $appName | awk '{print $3;}' )
    [[ $state != "Running" ]] || break
    sleep 5
done

kubectl logs -f $pod
