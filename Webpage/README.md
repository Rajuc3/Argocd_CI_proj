sudo docker build -t flaskapp .
docker run --publish 8000:5000 --rm flaskapp:latest


workflow:-
 1) It is a webpage app which is running in local
 2) We are building a docker image and pushing it to Ecr using python code
 3) Now we are creating a eks cluster and node group and creating a deployment and service file using
    python code and it also conatins our docker image from ecr in the code.
 4) Now once the deployment and service files are ran, we can see the pods are running and by port forwarding 
    we can access our app which is deployed using kubernetes.
 
