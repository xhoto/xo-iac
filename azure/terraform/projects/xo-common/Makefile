.PHONY: build help
spName:="xo-owner"
kvName:="kv-xo"
export TF_VAR_az_client_id = $(shell az ad app list --display-name $(spName) --query "[].{id:appId}" -o tsv)
export TF_VAR_az_client_secret = $(shell az keyvault secret show --vault-name $(kvName) --name $(spName)-secret | jq -r '.value')

all: help

help: ## display help
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: ## terraform init
	@terraform init

plan: init ## terraform plan
	@terraform plan

apply: init ## terraform apply
	@terraform apply

destroy: ## terraform destroy
	@terraform destroy

clean: ## remove terraform providers and state files
	@rm -rf .terraform
	@rm -f terraform.tfstate
	@rm -f terraform.tfstate.backup
	@rm -f .terraform.tfstate.lock.info
	@rm -f .terraform.lock.hcl