
## CLOUD RUN

# Create storage bucket to store images

gsutil mb  gs://dats575-projects

# upload pizza-app code on cloud shell
git clone https://github.com/karen397/DATS575.git
cd ~/pizza-app

# test application
npm start

#click on preview on port 8080 then ctrl + C

# create artifact repository with name pizza-app



gcloud auth configure-docker 

gcloud builds submit --tag europe-west12-docker.pkg.dev/${GOOGLE_CLOUD_PROJECT}/pizza-app/my-pizza-app:1.0.0

gcloud run deploy pizza-app --image europe-west12-docker.pkg.dev/${GOOGLE_CLOUD_PROJECT}/pizza-app/my-pizza-app:1.0.0 --region europe-west12 --port=80


# make some changes to the code

# build second version
gcloud builds submit --tag europe-west12-docker.pkg.dev/${GOOGLE_CLOUD_PROJECT}/pizza-app/my-pizza-app:2.0.0

# new revision on cloud run
gcloud run deploy pizza-app --image europe-west12-docker.pkg.dev/${GOOGLE_CLOUD_PROJECT}/pizza-app/my-pizza-app:2.0.0 --region europe-west12 --port=80


 
## KUBERNETES GKE


# create a k8s cluster with 3 nodes
gcloud container clusters create pizza-cluster --num-nodes 1 --region=europe-west12

# list the nodes on the gke cluster
gcloud compute instances list


cd kubernetes

# authenticate to k8s cluster
gcloud container clusters get-credentials pizza-cluster --region europe-west12 --project dats575-projects

# deploy a deployments to gke cluster

kubectl apply -f deployment.yaml

kubectl get deployment

# create a k8s load balancer service to expose the deployment 

kubectl apply -f service.yaml

kubectl get service

# navigate to the web app in the url exposed by the k8s load balancer service









## COMPUTE ENGINE

# Create a bucket to host the code 

gsutil mb  gs://dats575-projects


# copy the startup script to the bucket

gsutil cp ~/pizza-app/compute-engine/startup-script.sh gs://dats575-projects


# copy the code to the bucket

cd ~
rm -rf pizza-app/*/node_modules
gsutil -m cp -r pizza-app gs://dats575-projects/


# create the compute engine machine

gcloud compute instances create backend \
    --zone=europe-west12-a \
    --machine-type=e2-standard-2 \
    --tags=webapp \
   --metadata=startup-script-url=https://storage.googleapis.com/dats575-projects/startup-script.sh


# verify creation of compute engine instance

gcloud compute instances list


# copy the URL ip from the instance and verify web app deployment

