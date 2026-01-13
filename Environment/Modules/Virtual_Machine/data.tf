data "azurerm_network_interface" "nics" {
  for_each = {
    frontend = {
      name                = "frontend_nic"
      resource_group_name = "ganesha"
    }
    backend = {
      name                = "backend_nic"
      resource_group_name = "ganesha"
    }
  }

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}
data "azurerm_key_vault_secret" "vm_username" {
  for_each = var.vm
  name         = each.value.username_secret
  key_vault_id = data.azurerm_key_vault.kv.id
}
data "azurerm_key_vault_secret" "vm_password" {
  for_each = var.vm
  name         = each.value.password_secret
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault" "kv" {
  name                = "frontendvmkeyvault"
  resource_group_name = "ganesha"
}
