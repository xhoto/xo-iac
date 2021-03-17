module "global_variables" {
  source="../global_variables"
}

resource "azurerm_user_assigned_identity" "clusterIdentity" {
  name                = var.name
  resource_group_name = var.rg.name
  location            = var.rg.location
  tags                = module.global_variables.tags
}

resource "azurerm_role_assignment" "ra0" {
  scope                 = var.rg_common.id
  role_definition_name  = "Reader"
  principal_id          = azurerm_user_assigned_identity.clusterIdentity.principal_id
  depends_on            = [azurerm_user_assigned_identity.clusterIdentity, var.rg_common]
}

resource "azurerm_role_assignment" "ra1" {
  scope                 = var.rg.id
  role_definition_name  = "Reader"
  principal_id          = azurerm_user_assigned_identity.clusterIdentity.principal_id
  depends_on            = [azurerm_user_assigned_identity.clusterIdentity, var.rg]
}

resource "azurerm_role_assignment" "ra2" {
  scope                 = azurerm_user_assigned_identity.clusterIdentity.id
  role_definition_name  = "Managed Identity Operator"
  principal_id          = azurerm_user_assigned_identity.clusterIdentity.principal_id
  depends_on            = [azurerm_user_assigned_identity.clusterIdentity]
}

resource "azurerm_role_assignment" "ra3" {
  scope                 = var.vnet.id
  role_definition_name  = "Contributor"
  principal_id          = azurerm_user_assigned_identity.clusterIdentity.principal_id
  depends_on            = [azurerm_user_assigned_identity.clusterIdentity, var.vnet]
}

resource "azurerm_role_assignment" "ra4" {
  scope                 = var.snet.id
  role_definition_name  = "Network Contributor"
  principal_id          = azurerm_user_assigned_identity.clusterIdentity.principal_id
  depends_on            = [azurerm_user_assigned_identity.clusterIdentity, var.snet]
}

resource "azurerm_role_assignment" "ra5" {
  scope                 = var.agw.id
  role_definition_name  = "Contributor"
  principal_id          = azurerm_user_assigned_identity.clusterIdentity.principal_id
  depends_on            = [azurerm_user_assigned_identity.clusterIdentity, var.agw]
}

output "instance" {
  value = azurerm_user_assigned_identity.clusterIdentity
}