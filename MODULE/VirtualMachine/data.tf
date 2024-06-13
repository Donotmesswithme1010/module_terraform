data "azurerm_network_interface" "niccard1" {
  for_each = var.vms
  name                = each.value.nics
  resource_group_name = "devopsrg1"
}

data "azurerm_key_vault" "key" {
  name                = "wg1655keyvault1"
  resource_group_name = "devopsrg1"
}

data "azurerm_key_vault_secret" "user" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.key.id
}
data "azurerm_key_vault_secret" "pass" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.key.id
}