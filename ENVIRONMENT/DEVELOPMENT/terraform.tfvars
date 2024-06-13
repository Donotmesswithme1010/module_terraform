rgs = {
  "rg1" = {
    name     = "devopsrg1"
    location = "West Europe"
  }
}

vnets = {
  "vnet1" = {
    name                = "vnet-devops1"
    location            = "West Europe"
    resource_group_name = "devopsrg1"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  "subnet1" = {
    name                 = "frontend-subnet"
    resource_group_name  = "devopsrg1"
    virtual_network_name = "vnet-devops1"
    address_prefixes     = ["10.0.1.0/24"]
  }
  "subnet2" = {
    name                 = "backend-subnet"
    resource_group_name  = "devopsrg1"
    virtual_network_name = "vnet-devops1"
    address_prefixes     = ["10.0.2.0/24"]
  }

  "subnet3" = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "devopsrg1"
    virtual_network_name = "vnet-devops1"
    address_prefixes     = ["10.0.3.0/24"]
  }
}

vms = {
  vm1 = {
    nics  = "frontendvm-nic"
    name                  = "frontendvm"
    resource_group_name   = "devopsrg1"
    location              = "West Europe"
    size                  = "Standard_DS1_v2"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }
  }
  vm2 = {
    nics = "backendvm-nic"
    name                  = "backendvm"
    resource_group_name   = "devopsrg1"
    location              = "West Europe"
    size                  = "Standard_DS1_v2"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }
  }
  vm3 = { 
    nics = "frontendvm2-nic"
    name                  = "frontendvm2"
    resource_group_name   = "devopsrg1"
    location              = "West Europe"
    size                  = "Standard_DS1_v2"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }
  }
}

pips = {
  "pip0" = {
    name                = "pip0"
    resource_group_name = "devopsrg1"
    location            = "West Europe"
    allocation_method   = "Static"
    sku                 = "Basic"
  }

    "pip1" = {
    name                = "pip1"
    resource_group_name = "devopsrg1"
    location            = "West Europe"
    allocation_method   = "Static"
    sku                 = "Basic"
  }

  "pip2" = {
    name                = "pip2"
    resource_group_name = "devopsrg1"
    location            = "West Europe"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

nsg_map = {
  "nsg1" = {
    name                = "frontendvm-nsg"
    location            = "West Europe"
    resource_group_name = "devopsrg1"
  }
  "nsg2" = {
    name                = "frontendvm2-nsg"
    location            = "West Europe"
    resource_group_name = "devopsrg1"
  }
  "nsg3" = {
    name                = "backendvm-nsg"
    location            = "West Europe"
    resource_group_name = "devopsrg1"
  }
}

association_map = {
  "a1" = {
  
  }
 
}

nics = {
  nic1 = {
    name                 = "frontendvm-nic"
    location             = "West Europe"
    resource_group_name  = "devopsrg1"
  }
    
  nic2 = {
    name                 = "backendvm-nic"
    location             = "West Europe"
    resource_group_name  = "devopsrg1"
   
  }
  nic3 = {
    name                 = "frontendvm2-nic"
    location             = "West Europe"
    resource_group_name  = "devopsrg1"
  }
}

servers = {
  "srv1" = {
    name                         = "devopserver1"
    resource_group_name          = "devopsrg1"
    location                     = "west us"
    version                      = "12.0"
    administrator_login          = "devopsadmin"
    administrator_login_password = "P@ssw01rd@123"
  }
}

dbs = {
  "db1" = {
    name                = "todoappdb"
    resource_group_name = "devopsrg1"
    location            = "west us"
    server_name         = "devopserver1"
  }
}