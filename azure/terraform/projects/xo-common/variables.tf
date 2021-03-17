variable "az_subscription_id" {
  description = "The Subscription ID for the Service Principal to use for AKS"
}

variable "az_client_id" {
  description = "The Client ID for the Service Principal to use for AKS"
}

variable "az_client_secret" {
  description = "The Client Secret for the Service Principal to use for AKS"
}

variable "az_tenant_id" {
  description = "The Tenant ID for the Service Principal to use for AKS"
}

variable "rg_name" {
  description = "The resoure group name for common"
}

variable "acr_name" {
  description = "The azure container registry name"
}

variable "acr_sku" {
  description = "The azure container registry sku"
}