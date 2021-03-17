variable "name" {
  description = "The name for container registry"
}

variable "rg" {
  description = "The resoure group for container registry"
}

variable "sku" {
  description = "The sku for container registry"
  default = "Basic"
}