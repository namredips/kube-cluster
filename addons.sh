#!/bin/bash

update_token () {
  TOKEN=$(kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}")
  kubectl config set-credentials kubernetes-admin --token="${TOKEN}"
}

deploy_dashboard () {
  kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.4.0/aio/deploy/recommended.yaml

  kubectl apply -f dashboard-adminuser.yaml
  kubectl apply -f dashboard-adminuser-roles.yaml

  update_token
}

$1
