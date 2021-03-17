module "global_variables" {
  source = "../../mgmt/global_variables"
}

resource "azurerm_kubernetes_cluster_node_pool" "aks_node_pool" {
  name                  = var.name
  kubernetes_cluster_id = var.aks.id

  enable_auto_scaling = var.enable_auto_scaling
  vm_size             = var.node_vm_size
  node_count          = var.node_count
  min_count           = var.node_min_count
  max_count           = var.node_max_count
  tags                = module.global_variables.tags
}
