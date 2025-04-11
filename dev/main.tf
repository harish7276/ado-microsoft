# test vnet creating
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = "West Europe"
  resource_group_name = "sanofi-dev-rg"
  address_space       = ["10.0.0.0/16"]
#   dns_servers         = ["10.0.0.4", "10.0.0.5"]


  }


