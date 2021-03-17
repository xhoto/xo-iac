module "global_variables" {
  source="../../mgmt/global_variables"
}

resource "azurerm_private_endpoint" "ple" {
  name                = var.name
  resource_group_name = var.rg.name
  location            = var.rg.location
  subnet_id           = var.snet.id

  private_service_connection {
    name                           = "psc-${var.name}"
    private_connection_resource_id = var.private_connection_resource.id 
    subresource_names              = var.subresource_names 
    is_manual_connection           = false
  }
  tags                = module.global_variables.tags
}