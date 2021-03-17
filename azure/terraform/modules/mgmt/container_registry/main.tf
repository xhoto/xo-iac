module "global_variables" {
  source="../global_variables"
}

resource "azurerm_container_registry" "acr" {
  name                     = var.name
  resource_group_name      = var.rg.name
  location                 = var.rg.location
  sku                      = var.sku 
  admin_enabled            = false
}

output "instance" {
  value = azurerm_container_registry.acr
}