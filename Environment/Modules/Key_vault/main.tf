resource "azurerm_key_vault" "kv" {
    for_each = var.kv
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = each.value.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  #rbac_authorization_enabled= true
  purge_protection_enabled    = each.value.purge_protection_enabled

  sku_name =each.value.sku_name
  public_network_access_enabled = true

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Delete",
      "Get",
      "List",
      "Set",
    ]

    storage_permissions = [
      "Set",
    ]
  }
}

resource "azurerm_role_assignment" "kv_secrets_officer" {
  for_each = var.kv
  scope                = azurerm_key_vault.kv[each.key].id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = data.azurerm_client_config.current.object_id
}