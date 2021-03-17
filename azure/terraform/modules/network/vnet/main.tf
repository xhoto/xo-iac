module "global_variables" {
  source="../../mgmt/global_variables"
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  resource_group_name = var.rg.name
  location            = var.rg.location
  address_space       = var.vnet_address_space

  dynamic "subnet" {
    for_each = var.snet_address_prefix_map
    content {
      name           = subnet.key
      address_prefix = subnet.value
    }
  }
  tags     = module.global_variables.tags
}

resource "azurerm_subnet" "snet_ple" {
  name                 = var.snet_ple_name
  resource_group_name  = var.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes       = var.snet_ple_address_prefix
  enforce_private_link_endpoint_network_policies = true
}

output "instance" {
  value = azurerm_virtual_network.vnet
}

output "subnets" {
  value = {
    for obj in azurerm_virtual_network.vnet.subnet : obj.name => obj
  }
}

output "snet_ple" { 
  value = azurerm_subnet.snet_ple
}