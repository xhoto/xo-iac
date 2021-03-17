variable "name" {
  description = "aad name"
}

variable "rg" {
  description = "resource group"
}

variable "mariadb_administrator_login" {
  description = "maria db administrator login id"
} 

variable "mariadb_administrator_login_password" {
  description = "maria db administrator login password"
}

variable "mariadb_sku_name" {
  description = "maria db sku name"
}

variable "mariadb_storage_mb" {
  description = "maria db storage"
}
variable "ssl_enforcement_enabled" {}
variable "public_network_access_enabled" {}
variable "auto_grow_enabled" {}
variable "geo_redundant_backup_enabled" {}
variable "mariadb_server_version" {
  default = "10.3"
}
variable "mariadb_server_backup_retention_days" {
  default = 7
}