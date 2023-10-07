#!/bin/bash
ARGOCD_SERVER=argocd.master.com
USERNAME=admin
PASSWORD=$(kubectl -n argo-cd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
echo $PASSWORD

argocd login $ARGOCD_SERVER --grpc-web  --skip-test-tls --username $USERNAME --password $PASSWORD

#argocd app list
#argocd proj list
