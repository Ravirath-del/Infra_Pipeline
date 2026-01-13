resource "azurerm_linux_virtual_machine" "VMs" {
    for_each = var.vm
  name                  = each.value.name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  network_interface_ids = [data.azurerm_network_interface.nics[each.value.nic_key].id]
  size                  = each.value.size
  admin_username = data.azurerm_key_vault_secret.vm_username[each.key].value
  admin_password = data.azurerm_key_vault_secret.vm_password[each.key].value
  disable_password_authentication = each.value.disable_password_authentication
 

  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

}