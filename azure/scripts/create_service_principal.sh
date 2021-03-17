#!/bin/sh
# azure login
az login --tenant <tenant-id>

# set azure service principal name and keyvault name
spName="xo-owner"
kvName="kv-xo"

# azure account list
subscriptionId=$(az account list --query "[?name=='<subscription_name>'].{subscriptionId:id}" -o tsv)

# select subscription
az account set --subscription=$subscriptionId

# create Azure AD app
az ad app create --display-name $spName 

# Create the Service Principal
spPassword=$(az ad sp create-for-rbac \
    --name $spName \
    --role Owner \
    --scopes /subscriptions/$subscriptionId | jq -r '.password')

# set secret key
az keyvault secret set --vault-name $kvName --name "$spName-secret" --value $spPassword

# get az_client_id
az_client_id=$(az ad app list --display-name $spName --query "[].{id:appId}" -o tsv)

# get secret from key-vault
az_client_secret=$(az keyvault secret show --vault-name $kvName --name $spName-secret | jq -r '.value')

export TF_VAR_az_client_id=$az_client_id
export TF_VAR_az_client_secret=$az_client_secret

