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