# prod vnet creating new
resource "azurerm_virtual_network" "harish" {
  name                = "harish-network"
  location            = "West Europe"
  resource_group_name = "sanofi-dev-rg"
  address_space       = ["10.2.0.0/16"]
}

resource "azurerm_virtual_network" "harishtest" {
  name                = "harish-vnet"
  location            = "West Europe"
  resource_group_name = "sanofi-dev-rg"
  address_space       = ["10.1.0.0/16"]
}


