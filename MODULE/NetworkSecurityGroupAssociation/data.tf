data "azurerm_network_interface" "niccard1" {
  name                = "frontendvm-nic"
  resource_group_name = "devopsrg1"
}
data "azurerm_network_security_group" "nsg1" {
  name                = "frontendvm-nsg"
  resource_group_name = "devopsrg1"
}
