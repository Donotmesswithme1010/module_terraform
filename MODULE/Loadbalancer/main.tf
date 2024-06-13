resource "azurerm_lb" "loadbalancers" {
  name                = "frontload"
  location            = "West Europe"
  resource_group_name = "devopsrg1"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.lbpip.id
  }
}

resource "azurerm_lb_backend_address_pool" "frontend-pool" {
  loadbalancer_id = azurerm_lb.loadbalancers.id
  name            = "frontendPool"
}

resource "azurerm_network_interface_backend_address_pool_association" "frontend1" {
  network_interface_id    = data.azurerm_network_interface.niccard1.id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.frontend-pool.id
}


resource "azurerm_lb_probe" "probe" {
  loadbalancer_id = azurerm_lb.loadbalancers.id
  name            = "frontend-probe"
  port            = 80
}

resource "azurerm_lb_rule" "rule" {
  loadbalancer_id                = azurerm_lb.loadbalancers.id
  name                           = "frontendRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids = [ azurerm_lb_backend_address_pool.frontend-pool.id ]
  probe_id = azurerm_lb_probe.probe.id
}