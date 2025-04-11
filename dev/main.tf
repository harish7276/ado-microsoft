# dev vnet creating
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = "West Europe"
  resource_group_name = "sanofi-dev-rg"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_virtual_network" "dev" {
  name                = "dev-vnet"
  location            = "West Europe"
  resource_group_name = "sanofi-dev-rg"
  address_space       = ["10.1.0.0/16"]
}


