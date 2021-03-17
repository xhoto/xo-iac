variable "name" { description = "The name for aks" }
variable "aks" { description = "azure kubernetes service" }
variable "node_vm_size" { default = "Standard_DS3_v2" }
variable "enable_auto_scaling" { description = true}
variable "node_count" { default = 1 } 
variable "node_min_count" { default = 1 }
variable "node_max_count" { default = 10 }