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

variable "redis_cache_enable_non_ssl_port" { description = "redis cache enable non ssl port"}
variable "redis_cache_minimum_tls_version" { description = "redis cache minimum tls version" }