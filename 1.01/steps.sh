image=sernalen/k8scourse-p1.01-log-output:latest
docker build . -t $image
docker push $image
kubectl create deployment randomstring --image=$image
kubectl get deployments
kubectl get pods
pod=$( kubectl get pods | grep randomstring| awk '{print $1;}' )
echo $pod
kubectl logs -f $pod
