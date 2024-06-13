module "mrgs"{
    source = "../../MODULE/ResourceGroup"
rgs=var.rgs
}

module "mvnets"{
  depends_on = [ module.mrgs ]
    source = "../../MODULE/VirtualNetwork"
    vnets=var.vnets

}

module "msubnets" {
  depends_on = [ module.mrgs,module.mvnets ]
  source = "../../MODULE/Subnet"
  subnets = var.subnets
}

module "mvms" {
  depends_on = [ module.mrgs,module.mnics ]
    source = "../../MODULE/VirtualMachine"
  vms = var.vms
 
 
}

module "mpips" {
  depends_on = [ module.mrgs ]
    source = "../../MODULE/PublicIP"
  pips = var.pips
}

module "mnsgs" {
  depends_on = [ module.mrgs ]
  source = "../../MODULE/NetworkSecurityGroup"
  nsg_map=var.nsg_map
  
}

module "mnsga" {
  depends_on = [  module.mnics,module.mnsgs]
  source = "../../MODULE/NetworkSecurityGroupAssociation"
  association_map = var.association_map
  
}

module "mnics" {
  depends_on = [ module.mrgs,module.msubnets ]
  source = "../../MODULE/NetworkInterface"
  nics = var.nics
}

module "msqs" {
  depends_on = [ module.mrgs ]
  source = "../../MODULE/AzureSQLServer"
 servers = var.servers  
}

module "msqd" {
  depends_on = [ module.mrgs,module.msqs ]
  source = "../../MODULE/AzureSQLDatabase"
  dbs = var.dbs
}
module "mkv" {
  depends_on = [ module.mrgs ]
  source = "../../MODULE/KeyVault"
  
}

module "mabs" {
  depends_on = [ module.mrgs ] 
  source = "../../MODULE/AzureBastion"
}

module "mlbs" {
  depends_on = [ module.mrgs,module.mpips ]
  source = "../../MODULE/Loadbalancer"
}