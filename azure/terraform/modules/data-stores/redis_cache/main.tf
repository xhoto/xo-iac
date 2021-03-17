module "global_variables" {
  source="../../mgmt/global_variables"
}

locals {
  azurerm_redis_cache_enable_non_ssl_port = false
  azurerm_redis_cache_minimum_tls_version = "1.2"
}

resource "azurerm_redis_cache" "redis" {
  name                = var.name
  resource_group_name = var.rg.name
  location            = var.rg.location
  capacity            = var.redis_capacity
  family              = var.redis_family
  sku_name            = var.redis_sku_name
  subnet_id           = var.snet.id
  enable_non_ssl_port = local.azurerm_redis_cache_enable_non_ssl_port
  minimum_tls_version = local.azurerm_redis_cache_minimum_tls_version
  tags                = module.global_variables.tags
}