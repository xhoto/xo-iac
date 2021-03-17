module "global_variables" {
  source="../global_variables"
}

resource "azurerm_resource_group" "rg" {
  for_each = var.rg_map
  name     = each.key
  location = each.value
  tags     = module.global_variables.tags
}

output "rg" {
  value = azurerm_resource_group.rg[var.rg_name]
}