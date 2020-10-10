docker build -t nanda1995/k8s-client:latest -t nanda1995/k8s-client:$SHA -f ./client/Dockerfile ./client
docker build -t nanda1995/k8s-server:latest -t nanda1995/k8s-server:$SHA -f ./server/Dockerfile ./server
docker build -t nanda1995/k8s-worker:latest -t nanda1995/k8s-worker:$SHA -f ./worker/Dockerfile ./worker

docker push nanda1995/k8s-client:latest
docker push nanda1995/k8s-server:latest
docker push nanda1995/k8s-worker:latest

docker push nanda1995/k8s-client:$SHA
docker push nanda1995/k8s-server:$SHA
docker push nanda1995/k8s-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/client-depl client=nanda1995/k8s-client:$SHA
kubectl set image deployments/server-depl server=nanda1995/k8s-server:$SHA
kubectl set image deployments/worker-depl worker=nanda1995/k8s-worker:$SHA
