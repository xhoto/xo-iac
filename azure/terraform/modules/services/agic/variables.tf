variable "name" {
  description = "aad name"
}

variable "rg" {
  description = "resource group"
}

variable "agw" {
  description = "application gateway"
}

variable "aks" {
  description = "azure kubernetes service"
}

variable "uai" {
  description = "user assigned identity"
}

variable "usePrivateIP" {
  description = "use privae ip in application gateway"
  type        = bool
  default = false
}

variable "az_subscription_id" {
  description = "az subscription id"
}