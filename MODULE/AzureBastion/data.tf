data "azurerm_subnet" "azsubnet" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "vnet-devops1"
  resource_group_name  = "devopsrg1"
}

data "azurerm_public_ip" "azpip" {
  name                = "pip2"
  resource_group_name = "devopsrg1"
}