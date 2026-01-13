resource "azurerm_key_vault_secret" "vm_username" {
    for_each = var.vm_user
  name         = each.value.name
  value        = each.value.value
  key_vault_id = data.azurerm_key_vault.kv.id
  lifecycle {
  prevent_destroy = true
}
}
resource "azurerm_key_vault_secret" "vm_password" {
    for_each = var.vm_pass
  name         = each.value.name
  value        = each.value.value
  key_vault_id = data.azurerm_key_vault.kv.id
  lifecycle {
  prevent_destroy = true
}
}