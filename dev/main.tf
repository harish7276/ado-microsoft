module "vnet_east" {
  source              = "../modules/network"
  vnet_name           = "vnet-east"
  address_space       = ["10.10.0.0/16"]
  location            = "East US"
  resource_group_name = "sanofi-dev-rg"
  tags = {
    environment = "dev"
  }
  subnets = [
    {
      name             = "subnet1"
      address_prefixes = ["10.10.1.0/24"]
    },
    {
      name             = "subnet2"
      address_prefixes = ["10.10.2.0/24"]
      service_endpoints = ["Microsoft.Storage"]
    }
  ]
}

module "vnet_west" {
  source              = "../modules/network"
  vnet_name           = "vnet-west"
  address_space       = ["10.20.0.0/16"]
  location            = "West US"
  resource_group_name = "sanofi-dev-rg"
  tags = {
    environment = "prod"
  }
  subnets = [
    {
      name             = "backend"
      address_prefixes = ["10.20.1.0/24"]
    },
    {
      name             = "frontend"
      address_prefixes = ["10.20.2.0/24"]
    }
  ]
}


module "vm1" {
  source              = "../modules/compute"
  vm_name             = "vm-east-1"
  location            = "East US"
  resource_group_name = "rg-network"
  subnet_id           = module.vnet_east.subnet1 # If you expose subnet_ids as output
  admin_username      = data.azurerm_key_vault_secret.admin_username.value
  admin_password      = data.azurerm_key_vault_secret.admin_password.value
  tags = {
    environment = "dev"
  }
}

module "vm2" {
  source              = "../modules/compute"
  vm_name             = "vm-west-1"
  location            = "West US"
  resource_group_name = "rg-network"
  subnet_id           = module.vnet_west.backend
  admin_username      = data.azurerm_key_vault_secret.admin_username.value
  admin_password      = data.azurerm_key_vault_secret.admin_password.value
  tags = {
    environment = "prod"
  }
}

