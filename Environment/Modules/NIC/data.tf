data "azurerm_subnet" "subnets" {
  for_each = {
    frontend = {
      name = "ganesha_frontendsubnet"
    }
    backend = {
      name = "ganesha_backend"
    }
  }

  name                 = each.value.name
  virtual_network_name = "ganesha_vnet"
  resource_group_name  = "ganesha"
}
data "azurerm_public_ip" "pips" {
  for_each = var.nic
  name                = each.value.pip_key
  resource_group_name = "ganesha"
}