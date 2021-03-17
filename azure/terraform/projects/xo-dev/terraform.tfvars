az_subscription_id = "<az_subscription_id>"
az_tenant_id = "<az_tenant_id>"

rg_map = {
  rg-xo-dev = "Korea Central"
}

pip_map = {
  pip-xo-dev-ib1 = "Korea Central"
  pip-xo-dev-ob1 = "Korea Central"
}

rg_name = "rg-xo-dev"
rg_common_name = "rg-xo-common"

vnet_name = "vnet-xo-dev"
vnet_address_space = ["10.0.0.0/8"]
snet_address_prefix_map = {
  snet-aks     = "10.240.0.0/16"
  snet-gateway = "10.241.1.0/27"
}
snet_ple_name = "snet-data"
snet_ple_address_prefix = ["10.241.0.0/24"]

aks_name = "aks-xo-dev"
node_vm_size = "Standard_DS3_v2"
node_count = 1
node_min_count = 1
node_max_count = 20
pip_ib_name = "pip-xo-dev-ib1"
pip_ob_name = "pip-xo-dev-ob1"
agw_name = "agw-xo-dev"
id_name = "id-xo-dev"
agic_name = "agic-xo-dev"

mariadb_name = "admd-xo-dev"
mariadb_administrator_login = "<admin_id>"
mariadb_administrator_login_password = "<admin_password>"
mariadb_sku_name = "B_Gen5_2"
mariadb_storage_mb = 10240