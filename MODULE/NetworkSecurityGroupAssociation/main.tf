resource "azurerm_network_interface_security_group_association" "association" {
  for_each                  = var.association_map
  network_interface_id      = data.azurerm_network_interface.niccard1.id 
  network_security_group_id = data.azurerm_network_security_group.nsg1.id
}