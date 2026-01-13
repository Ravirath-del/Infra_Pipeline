resource "azurerm_network_security_group" "nsgs" {
    for_each = var.nsg
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_associate" {
    for_each = var.nsg
  subnet_id                 = data.azurerm_subnet.subnets[each.value.subnet_key].id
  network_security_group_id = azurerm_network_security_group.nsgs[each.key].id
}