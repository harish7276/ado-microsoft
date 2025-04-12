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
