resource "azurerm_network_interface" "nics" {
    for_each = var.nic
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

# dynamic "ip_configuration" {
#     for_each=each.value.ip_configuration
#     content {
#  name = ip_configuration.value
#     subnet_id =data.azurerm_subnet.subnets[each.value.subnet_key].id
#     private_ip_address_allocation =ip_configuration.value.private_ip_address_allocation
#   }
#   }
  ip_configuration {
    name                          = each.value.ip_name
    subnet_id                     = data.azurerm_subnet.subnets[each.value.subnet_key].id
    private_ip_address_allocation = "Dynamic"
     public_ip_address_id= data.azurerm_public_ip.pips[each.key].id
  }
}