resource "azurerm_bastion_host" "bastions" {
  name                = "bastion1"
  location            = "West Europe"
  resource_group_name = "devopsrg1"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.azsubnet.id
    public_ip_address_id = data.azurerm_public_ip.azpip.id
  }
}