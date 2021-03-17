module "global_variables" {
  source="../../mgmt/global_variables"
}

locals {
  azurerm_public_ip_allocation_method = "Static"
  azurerm_public_ip_sku               = "Standard"
}

resource "azurerm_public_ip" "pip" {
  for_each            = var.pip_map
  name                = each.key
  location            = each.value
  resource_group_name = var.rg.name
  domain_name_label   = lower(each.key)
  allocation_method   = local.azurerm_public_ip_allocation_method
  sku                 = local.azurerm_public_ip_sku
  tags                = module.global_variables.tags
}

output "instances" {
  value = zipmap(
    [
      for instance in azurerm_public_ip.pip:
        instance.name
    ], 
    [
      for instance in azurerm_public_ip.pip:
        instance
    ])
}