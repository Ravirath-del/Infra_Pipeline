module "rg" {
  Rgs    = var.Rgs
  source = "../Modules/Resource_group"
}
module "subnets" {
  depends_on = [module.rg]
  vnet       = var.vnet
  source     = "../Modules/Virtual_network"
}
module "pip" {
  depends_on = [module.rg]
  pip        = var.pip
  source     = "../Modules/Public_IP"
}
module "nics" {
  depends_on = [module.subnets]
  nic        = var.nic
  source     = "../Modules/NIC"
}
module "vm" {
  depends_on = [module.rg,
    module.nics,
  module.pip,
  module.kvs,
  module.kv_secret]
  vm     = var.vm
  source = "../Modules/Virtual_Machine"
}
module "nsg" {
  depends_on = [module.subnets]
  nsg        = var.nsg
  source     = "../Modules/Nsg"
}
module "kvs" {
  kv         = var.kv
  depends_on = [ module.rg ]
  source     = "../Modules/Key_vault"
}
module "kv_secret" {
  vm_user    = var.vm_user
  vm_pass    = var.vm_pass
  depends_on = [module.kvs]
  source     = "../Modules/Key_vault_secret"
}