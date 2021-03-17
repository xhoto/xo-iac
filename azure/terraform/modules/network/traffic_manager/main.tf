module "global_variables" {
  source = "../../mgmt/global_variables"
}

locals {
  azurerm_traffic_manager_profile_traffic_routing_method = "Weighted"
  azurerm_traffic_manager_endpoint_type                  = "azureEndpoints"
}

resource "azurerm_traffic_manager_profile" "tm" {
  name                   = var.name
  resource_group_name    = var.rg.name
  traffic_routing_method = local.azurerm_traffic_manager_profile_traffic_routing_method

  dns_config {
    relative_name = var.name
    ttl           = 300
  }

  monitor_config {
    protocol = "http"
    port     = 80
    path     = "/"
  }
}

resource "azurerm_traffic_manager_endpoint" "tm-endpoint" {
  for_each            = var.endpoint_map
  name                = "tm-ep-${lower(each.key)}"
  resource_group_name = var.rg.name
  profile_name        = azurerm_traffic_manager_profile.tm.name
  type                = local.azurerm_traffic_manager_endpoint_type
  target              = each.value.target
  target_resource_id  = var.pip_map[each.key].id #each.value.pip.id
  weight              = each.value.weight
}
