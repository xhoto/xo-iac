module "global_variables" {
  source="../global_variables"
}

locals {
  azurerm_application_insights_application_type = "other"
  azurerm_application_insights_aretention_in_days = 60
  azurerm_application_insights_adaily_data_cap_in_gb = 100
}

resource "azurerm_application_insights" "aai" {
  name                 = var.name
  resource_group_name  = var.rg.name
  location             = var.rg.location
  application_type     = local.azurerm_application_insights_application_type
  retention_in_days    = local.azurerm_application_insights_aretention_in_days
  daily_data_cap_in_gb = local.azurerm_application_insights_adaily_data_cap_in_gb
  tags     = module.global_variables.tags
}

# output "instrumentation_key" {
#   value = azurerm_application_insights.aai.instrumentation_key
# }

# output "app_id" {
#   value = azurerm_application_insights.aai.app_id
# }

output "instance" {
  value = azurerm_application_insights.aai
}