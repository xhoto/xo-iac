kubectl create namespace dapr-system
helm repo add dapr https://daprio.azurecr.io/helm/v1/repo
helm repo update
helm install dapr dapr/dapr --namespace dapr-system
kubectl get pods -n dapr-system -w

kubectl create namespace keda
helm repo add kedacore https://kedacore.github.io/charts
helm repo update
helm install keda kedacore/keda --namespace keda
kubectl get pods -n keda -w

kubectl create namespace cert-manager
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager jetstack/cert-manager --namespace cert-manager --version v0.13.1
kubectl get pods -n cert-manager -w

# kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.2.0/cert-manager.crds.yaml
# helm install \
#   cert-manager jetstack/cert-manager \
#   --namespace cert-manager \
#   --version v1.2.0 \
#   --create-namespace
#   --set installCRDs=true