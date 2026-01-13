data "azurerm_key_vault" "kv" {
  name                = "frontendvmkeyvault"
  resource_group_name = "ganesha"
}