module "global_variables" {
  source="../../mgmt/global_variables"
}

resource "azurerm_redis_cache" "redis" {
  name                = var.name
  resource_group_name = var.rg.name
  location            = var.rg.location
  capacity            = var.redis_capacity
  family              = var.redis_family
  sku_name            = var.redis_sku_name
  enable_non_ssl_port = var.redis_cache_enable_non_ssl_port
  minimum_tls_version = var.redis_cache_minimum_tls_version
  tags                = module.global_variables.tags
}