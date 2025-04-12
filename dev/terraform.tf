##################################################################################
# TERRAFORM CONFIG
##################################################################################
terraform {
    experiments = [module_variable_optional_attrs]
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~> 2.0"
        }
    }
    backend "azurerm" {
        key = "app.terraform.tfstate"
    }
}


##################################################################################
# PROVIDERS
##################################################################################

provider "azurerm" {
  features {}
}