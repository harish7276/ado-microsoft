data "azurerm_key_vault" "main" {
  name                = "sanofi-keyvault"
  resource_group_name = "sanofi-dev-rg"
}

data "azurerm_key_vault_secret" "admin_username" {
  name         = "vm-admin-username"
  key_vault_id = data.azurerm_key_vault.main.id
}

data "azurerm_key_vault_secret" "admin_password" {
  name         = "vm-admin-password"
  key_vault_id = data.azurerm_key_vault.main.id
}

# module "key_vaults" {
#   source = "../modules/key_vault"

#   resource_group_name = "sanofi-dev-rg"
#   location            = "East US"

#   tags = {
#     Environment = "dev"
#     Team        = "sanofi"
#     Owner       = "harish"
#   }

#   key_vaults = {
#     kv1 = {
#       name   = "haris-test-keyvault-1"
#       kv_sku = "Standard"

#       enabled_for_deployment          = false
#       enabled_for_disk_encryption     = false
#       enabled_for_template_deployment = false
#       enable_rbac_authorization       = true
#       soft_delete_retention_days      = 7
#       public_network_access_enabled   = true

#       network_acls = {
#         bypass                     = "AzureServices"
#         default_action             = "Deny"
#         ip_rules                   = ["10.0.0.0/16", "10.1.0.0/16"]
#         virtual_network_subnet_ids = module.vnet_east.subnet_ids["subnet1"]
#       }

#       access_policy = [
#         {
#           object_id               = "harish.vandana.01@gmail.com"
#           certificate_permissions = ["Get", "List"]
#           key_permissions         = ["Get", "List"]
#           secret_permissions      = ["Get", "List"]
#           storage_permissions     = ["Get", "List"]
#         }
#       ]
#     }

#     kv2 = {
#       name   = "harish-test-keyvault-2"
#       kv_sku = "Standard"

#       enabled_for_deployment          = false
#       enabled_for_disk_encryption     = false
#       enabled_for_template_deployment = false
#       enable_rbac_authorization       = false
#       soft_delete_retention_days      = 7
#       public_network_access_enabled   = false

#       network_acls = {
#         bypass                     = "AzureServices"
#         default_action             = "Deny"
#         ip_rules                   = []
#         virtual_network_subnet_ids = module.vnet_west.subnet_ids["backend"]
#       }

#       access_policy = [
#         {
#           object_id               = "harish.vandna.01@gmail.com"
#           certificate_permissions = ["Get", "List"]
#           key_permissions         = ["Get", "List"]
#           secret_permissions      = ["Get", "List"]
#           storage_permissions     = ["Get", "List"]
#         }
#       ]
#     }
#   }
# }
