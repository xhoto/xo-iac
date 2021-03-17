module "global_variables" {
  source="../../mgmt/global_variables"
}


resource "azurerm_mariadb_server" "mariadb" {
  name                = var.name
  resource_group_name = var.rg.name
  location            = var.rg.location
  administrator_login           = var.mariadb_administrator_login
  administrator_login_password  = var.mariadb_administrator_login_password
  sku_name                      = var.mariadb_sku_name
  storage_mb                    = var.mariadb_storage_mb
  version                       = var.mariadb_server_version
  backup_retention_days         = var.mariadb_server_backup_retention_days
  auto_grow_enabled             = var.auto_grow_enabled
  geo_redundant_backup_enabled  = var.geo_redundant_backup_enabled
  ssl_enforcement_enabled       = var.ssl_enforcement_enabled
  public_network_access_enabled = var.public_network_access_enabled
  tags                = module.global_variables.tags
}

output "instance" {
  value = azurerm_mariadb_server.mariadb
}

