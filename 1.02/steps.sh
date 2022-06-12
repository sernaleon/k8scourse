appName=p102
dockerUsername=sernalen
image=$dockerUsername/k8scourse-${appName}:latest
docker build . -t $image
docker push $image
kubectl create deployment $appName --image=$image
kubectl get deployments
kubectl get pods
pod=$( kubectl get pods | grep $appName | awk '{print $1;}' )
echo $pod
kubectl logs -f $pod
