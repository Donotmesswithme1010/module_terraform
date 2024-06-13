data "azurerm_network_interface" "niccard1" {
  name                = "frontendvm-nic"
  resource_group_name = "devopsrg1"
}

data "azurerm_public_ip" "lbpip" {
  name                = "pip1"
  resource_group_name = "devopsrg1"
}