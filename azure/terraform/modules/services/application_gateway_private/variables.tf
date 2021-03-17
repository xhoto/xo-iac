variable "name" {
  description = "The name for application gateway"
}

variable "rg" {
  description = "The resoure group for application gateway"
}

variable "subnet" {
  description = "The subnet for application gateway"
}

variable "inbound_ip_address" {
  description = "inbound ip address for application gateway"
}

variable "private_ip_address" { description = "private ip address for application gateway" }