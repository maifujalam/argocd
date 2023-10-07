#!/bin/bash
helm list -A
helm -n argo-cd install argo-cd ../manifests/argo-cd --create-namespace --namespace argo-cd -f ../manifests/argo-cd/values1.yaml
sleep 10
pass=$(kubectl -n argo-cd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d )
echo admin $pass
