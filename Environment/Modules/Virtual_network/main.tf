resource "azurerm_virtual_network" "vnets" {
    for_each = var.vnet
  name =each.value.name
  location=each.value.location
  resource_group_name =each.value.resource_group_name
  address_space = each.value.address_space
  dynamic "subnet" {
    for_each =each.value.subnet
    #   "ganesha_frontendsubnet"=["10.0.1.0/24"]
    #   "ganesha_backendsubnet"=["10.0.2.0/24"]
    # }
    content {
      name = subnet.value.name
      address_prefixes = subnet.value.address_prefixes

    }
  }
}
