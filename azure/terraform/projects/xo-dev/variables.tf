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

variable "rg_map" {
  description = "The map for resouce group name and location"
  type        = map
}

variable "rg_name" {
  description = "The resoure group name for common"
}

variable "rg_common_name" {
  description = "common resource group name"
}

variable "pip_map" {
  description = "The map for public ip name and location"
  type        = map
}

variable "vnet_name" {
  description = "The name for vnet"
}

variable "vnet_address_space" {
  description = "address space for vnet"
}

variable "snet_address_prefix_map" {
  description = "resource group name and prefix map for snet"
  type        = map
}

variable "snet_ple_name" {
  description = "snet name for private link endpoint"
}

variable "snet_ple_address_prefix" {
  description = "snet address prefix for private link endpoint"
}

variable "aks_name" {
  description = "aks name"
}

variable "node_vm_size" {
  description = "aks default node vm size"
}

variable "node_count" {
  description = "aks default node count"
}

variable "node_min_count" {
  description = "aks default node min count"
}

variable "node_max_count" {
  description = "aks default node max count"
}

variable "pip_ob_name" {
  description = "outbound public ip name"
}

variable "agw_name" {
  description = "application gateway name"
}

variable "pip_ib_name" {
  description = "inbound public ip name"
}

variable "id_name" {
  description = "user assigned identity name"
}

variable "agic_name" {
  description = "agic name"
}

variable "mariadb_name" {
  description = "maria db name"
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