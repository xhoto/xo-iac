variable "name" {
  description = "The name for virtual network"
}

variable "rg" {
  description = "The resoure group for virtual network"
}

variable "vnet_address_space" {
  description = "address space for vnet"
}

variable "snet_address_prefix_map" {
  description = "resource group name and prefix map for snet"
  type        = map
}

variable "snet_ple_name" {
  description = "snet name for private linke endpoint"
}

variable "snet_ple_address_prefix" {
  description = "snet address prefix for private linke endpoint"
}