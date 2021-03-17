terraform {
  backend "azurerm" {
    resource_group_name   = "rg-xo-common"
    storage_account_name  = "stxotfstate"
    container_name        = "tfstate-dev"
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

data "azurerm_resource_group" "rg_common" {
  name     = var.rg_common_name
}

module "resource_group" {
  source = "../../modules/mgmt/resource_group"
  rg_map = var.rg_map
  rg_name = var.rg_name
}

module "pip" {
  source = "../../modules/network/pip"
  pip_map = var.pip_map
  rg = module.resource_group.rg
}

module "vnet" {
  source = "../../modules/network/vnet"
  name = var.vnet_name
  rg = module.resource_group.rg
  vnet_address_space = var.vnet_address_space
  snet_address_prefix_map = var.snet_address_prefix_map
  snet_ple_name = var.snet_ple_name
  snet_ple_address_prefix = var.snet_ple_address_prefix
}

module "aks" {
  source = "../../modules/services/aks"
  name = var.aks_name
  rg = module.resource_group.rg
  az_client_id = var.az_client_id
  az_client_secret = var.az_client_secret
  subnet = module.vnet.subnets["snet-aks"]
  outbound_ip_address = module.pip.instances["pip-xo-dev-ob1"]
  node_vm_size = var.node_vm_size
  node_count = var.node_count
  node_min_count = var.node_min_count
  node_max_count = var.node_max_count
}

module "agw" {
  source = "../../modules/services/application_gateway"
  name = var.agw_name
  rg = module.resource_group.rg
  subnet = module.vnet.subnets["snet-gateway"]
  inbound_ip_address = module.pip.instances["pip-xo-dev-ib1"]
}

module "uai" {
  source = "../../modules/mgmt/user_assigned_identity"
  name = var.id_name
  rg = module.resource_group.rg
  rg_common = data.azurerm_resource_group.rg_common
  vnet = module.vnet.instance
  snet = module.vnet.subnets["snet-aks"]
  agw = module.agw.instance
}

module "agic" {
  source = "../../modules/services/agic"
  name = lower(var.agic_name)
  rg = module.resource_group.rg
  agw = module.agw.instance
  aks = module.aks.instance
  uai = module.uai.instance
  az_subscription_id = var.az_subscription_id
}

module "mariadb" {
  source = "../../modules/data-stores/mariadb"
  name = lower(var.mariadb_name)
  rg = module.resource_group.rg
  mariadb_administrator_login = var.mariadb_administrator_login
  mariadb_administrator_login_password = var.mariadb_administrator_login_password
  mariadb_sku_name = var.mariadb_sku_name
  mariadb_storage_mb = var.mariadb_storage_mb
  ssl_enforcement_enabled = false
  public_network_access_enabled = true
  auto_grow_enabled = false
  geo_redundant_backup_enabled = false
}
