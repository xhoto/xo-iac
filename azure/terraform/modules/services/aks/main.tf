module "global_variables" {
  source="../../mgmt/global_variables"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.name
  resource_group_name = var.rg.name
  location            = var.rg.location
  dns_prefix          = lower("${var.name}-dns")

  default_node_pool {
    name       = "default"
    enable_auto_scaling = true
    min_count = var.node_min_count
    max_count = var.node_max_count
    node_count = var.node_count
    vm_size    = var.node_vm_size

    vnet_subnet_id = var.subnet.id
    type = "VirtualMachineScaleSets"
  }

  service_principal {
    client_id     = var.az_client_id
    client_secret = var.az_client_secret
  }

  role_based_access_control {
    enabled = true
  }

  network_profile {
    network_plugin     = "azure"
    network_policy     = "azure"
    dns_service_ip     = "10.0.0.10"
    docker_bridge_cidr = "172.17.0.1/16"
    service_cidr       = "10.0.0.0/16"
    pod_cidr           = null
    load_balancer_sku  = "Standard"
    load_balancer_profile {
      outbound_ip_address_ids = [ var.outbound_ip_address.id ]
    }
  }
  tags                = module.global_variables.tags
}

output "instance" {
  value = azurerm_kubernetes_cluster.aks
}