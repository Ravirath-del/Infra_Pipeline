resource "azurerm_resource_group" "rg_group" {
  for_each = var.Rgs
  name =each.value.name
  location = each.value.location
}