#!/bin/bash
# ARGOCD_SERVER=argocd.master.com
ARGOCD_SERVER="argocd.master.com"
USERNAME=admin
PASSWORD=$(kubectl -n argo-cd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
# echo $PASSWORD

argocd login $ARGOCD_SERVER  --insecure  --username $USERNAME --password $PASSWORD  # --grpc-web  --skip-test-tls

printf "\nList of ArgoCD Apps\n"
argocd app list
printf "\nList of ArgoCD Projects\n"
argocd proj list
