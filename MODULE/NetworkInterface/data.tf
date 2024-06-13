data "azurerm_subnet" "subnet1" {
  name                 = "frontend-subnet"
  virtual_network_name = "vnet-devops1"
  resource_group_name  = "devopsrg1"
}