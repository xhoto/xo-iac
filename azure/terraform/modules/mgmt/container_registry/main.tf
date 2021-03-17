module "global_variables" {
  source="../global_variables"
}

locals {
  azurerm_container_registry_sku = "Premium" # Basic, Standard, Premium
}

resource "azurerm_container_registry" "acr" {
  name                     = var.name
  resource_group_name      = var.rg.name
  location                 = var.rg.location
  sku                      = var.sku
  tags                     = module.global_variables.tags
}