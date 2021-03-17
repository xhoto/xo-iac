variable "name" {
  description = "The name for aks"
}

variable "rg" {
  description = "The resoure group for aks"
}

variable "subnet" {
  description = "The subnet for aks"
}

variable "outbound_ip_address" {
  description = "outbound ip address for aks"
}

variable "az_client_id" {}

variable "az_client_secret" {}

variable "node_vm_size" {
  default = "Standard_D4s_v4"
  description = "Standard_D2s_v4: $86/M, Standard_D4s_v4: $172/M, Standard_DS3_v2: $240/M"
}

variable "node_count" {
  default = 1
}

variable "node_min_count" {
  default = 1
}

variable "node_max_count" {
  default = 20
}