variable "name" {
  description = "aad name"
}

variable "rg" {
  description = "resource group"
}

variable "redis_capacity" {
  description = "redis capacity"
} 

variable "redis_family" {
  description = "redis family"
}

variable "redis_sku_name" {
  description = "redis sku name"
}

variable "snet" {
  description = "The subnet for redis"
}
