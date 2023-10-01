# argocd
This project guides the installation steps of ArgoCD on Kubernetes cluster.It uses insecure argocd server,but it gets TLS termination 
at ingress layer[ Ref:- https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#option-2-ssl-termination-at-ingress-controller]

## Steps to install
1. Follow doc from https://github.com/argoproj/argo-helm/blob/main/charts/argo-cd/README.md#installing-the-chart
2. Follow helm chart artifactory from https://artifacthub.io/packages/helm/argo/argo-cd
3. Add helm chart repo.  
   `helm repo add argo https://argoproj.github.io/argo-helm`
4. Update helm repo: `helm repo update`
5. Search for argocd: `helm search repo argo-cd`
6. Pull argocd into manifests: `helm pull argo/argo-cd --version 5.46.4 --untar --untardir manifests`
7. Update argo-cd/values.yaml
8. Local render(Optional): helm template manifests/argo-cd --output-dir render
9. Install argocd: `helm -n argo-cd install argo-cd manifests/argo-cd --create-namespace --namespace argo-cd -f manifests/argo-cd/values1.yaml`
10. Uninstall argocd: `helm -n argo-cd uninstall argo-cd`
11. Verify by port forwarding: kubectl port-forward service/argo-cd-argocd-server -n argo-cd 8080:443
12. Access dashboard at: https://argocd.master.com:30443/
13. Creds are:- username:admin password: $(kubectl -n argo-cd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
