variable "name" {
  description = "The name for container registry"
}

variable "rg" {
  description = "The resource group for container registry"
}

variable "sku" {
  description = "container registry sku" # Basic, Standard, Premium
  default = "Premium"
}