# argocd
This project guides the installation steps of ArgoCD on Kubernetes cluster.

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
9. Install argocd: `helm -n argo-cd install argo-cd manifests/argo-cd --create-namespace --namespace argo-cd -f manifests/argo-cd/values.yaml`
10. Uninstall argocd: `helm -n argo-cd uninstall argo-cd`
