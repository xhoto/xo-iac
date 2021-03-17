# Introduction 
iac repoistory


# ToDo
- [x] [Get service principal credentials from azure key vault](https://docs.microsoft.com/en-us/azure/key-vault/secrets/quick-create-cli)
- [x] [Store Terraform state in Azure Storage](https://docs.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage)
- [ ] [Create aks namespae and security policy](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace)

# Getting Started
1. Install [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/)
2. Install [Terraform](https://www.terraform.io/)
3. Azure Login
```
$ az login --tenant <tenant-id>
```

# Deploy
```
$ cd azure/terraform/project/<Project>
$ make plan
$ make appy
```