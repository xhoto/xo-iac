module "global_variables" {
  source="../../mgmt/global_variables"
}

locals {
  azurerm_application_gateway_sku = "WAF_v2"
  azurerm_application_gateway_tier = "WAF_v2"
  azurerm_application_gateway_min_capacity = 1
  azurerm_application_gateway_max_capacity = 5
}

resource "azurerm_application_gateway" "ag" {
  name                = var.name
  resource_group_name = var.rg.name
  location            = var.rg.location

  sku {
    name = local.azurerm_application_gateway_sku
    tier = local.azurerm_application_gateway_tier
  }

  autoscale_configuration {
    min_capacity = local.azurerm_application_gateway_min_capacity
    max_capacity = local.azurerm_application_gateway_max_capacity
  }

  gateway_ip_configuration {
    name      = lower("${var.name}-GWCFG")
    subnet_id = var.subnet.id
  }

  frontend_port {
    name = lower("${var.name}-FRPORT")
    port = 80
  }

  frontend_ip_configuration {
    name                 = lower("${var.name}-FEIP")
    public_ip_address_id =  var.inbound_ip_address.id
  }

  frontend_ip_configuration {
    name                 = lower("VNET-${var.name}-FEPRIVATEIP")
    subnet_id = var.subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address = var.private_ip_address
  }

  backend_address_pool {
    name = lower("${var.name}-BEAP")
  }

  backend_http_settings {
    name                  = lower("${var.name}-BEHTST")
    cookie_based_affinity = "Disabled"
    path                  = "/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 1
  }

  http_listener {
    name                           = lower("${var.name}-HTTPLSTN")
    frontend_ip_configuration_name = lower("${var.name}-FEIP")
    frontend_port_name             = lower("${var.name}-FRPORT")
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = lower("${var.name}-RQRT")
    http_listener_name         = lower("${var.name}-HTTPLSTN")
    backend_address_pool_name  = lower("${var.name}-BEAP")
    backend_http_settings_name = lower("${var.name}-BEHTST")
    rule_type                  = "Basic"
  }
  tags                = module.global_variables.tags
}

output "instance" {
  value = azurerm_application_gateway.ag
}