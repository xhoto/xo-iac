terraform {
  backend "azurerm" {
    resource_group_name   = "rg-xo-common"
    storage_account_name  = "stxotfstate"
    container_name        = "tfstate-common"
    key                   = "terraform.tfstate"
    access_key            = "<access_key>"
  }
}

provider "azurerm" {
  subscription_id = var.az_subscription_id
  client_id       = var.az_client_id
  client_secret   = var.az_client_secret
  tenant_id       = var.az_tenant_id
  features {}
}


data "azurerm_resource_group" "rg" {
  name     = var.rg_name
}

/* module "resource_group" {
  source = "../../modules/mgmt/resource_group"
  rg_map = var.rg_map
  rg_name = var.rg_name
} */

module "acr" {
  source = "../../modules/mgmt/container_registry"
  name = var.acr_name
  rg = data.azurerm_resource_group.rg
  sku = var.acr_sku
}