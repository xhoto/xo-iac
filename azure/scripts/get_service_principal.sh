#!/bin/sh

# set azure service principal name and keyvault name
spName="xo-owner"
kvName="kv-xo"

# get az_client_id
az_client_id=$(az ad app list --display-name $spName --query "[].{id:appId}" -o tsv)

# get secret from key-vault
az_client_secret=$(az keyvault secret show --vault-name $kvName --name $spName-secret | jq -r '.value')

export TF_VAR_az_client_id=$az_client_id
export TF_VAR_az_client_secret=$az_client_secret