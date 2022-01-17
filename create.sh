# apply terraform changes: cluster and istio
tf apply

# configure kubectl to new cluster
gcloud container clusters get-credentials --zone us-central1 --project dsp-sock-shop-juan $(terraform workspace show)-gke-sock-shop
kubectx gke-$(terraform workspace show)=gke_dsp-sock-shop-juan_us-central1_$(terraform workspace show)-gke-sock-shop

# Install istio operators
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.12/samples/addons/prometheus.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.12/samples/addons/grafana.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.12/samples/addons/jaeger.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.12/samples/addons/kiali.yaml