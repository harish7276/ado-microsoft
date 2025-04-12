# #Create the key vault
# resource "azurerm_key_vault" "kv" {
#   for_each = var.key_vaults

#   name                = each.value.name
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   tenant_id           = data.azurerm_client_config.current.tenant_id
#   sku_name            = each.value.kv_sku

#   enabled_for_deployment          = each.value.enabled_for_deployment
#   enabled_for_disk_encryption     = each.value.enabled_for_disk_encryption
#   enabled_for_template_deployment = each.value.enabled_for_template_deployment
#   enable_rbac_authorization       = each.value.enable_rbac_authorization
#   soft_delete_retention_days      = each.value.soft_delete_retention_days
#   public_network_access_enabled   = each.value.public_network_access_enabled
#   # Allow public access from these IPs 
#   dynamic "network_acls" {
#     for_each = each.value.network_acls != null ? [true] : []
#     content {
#       bypass                     = each.value.network_acls.bypass
#       default_action             = each.value.network_acls.default_action
#       ip_rules                   = each.value.network_acls.ip_rules
#       virtual_network_subnet_ids = each.value.network_acls.virtual_network_subnet_ids
#     }
#   }
#   # Access policies, needed if Azure RBAC is disabled
#   dynamic "access_policy" {
#     for_each = each.value.enable_rbac_authorization ? [] : each.value.access_policy
#     content {
#       tenant_id               = data.azurerm_client_config.current.tenant_id
#       object_id               = access_policy.value.object_id
#       certificate_permissions = access_policy.value.certificate_permissions
#       key_permissions         = access_policy.value.key_permissions
#       secret_permissions      = access_policy.value.secret_permissions
#       storage_permissions     = access_policy.value.storage_permissions
#     }
#   }

#   tags = var.tags
# }

# # Assign kv admin to pipeline managed identity for further usage of the kv objects by terraform.
# resource "azurerm_role_assignment" "kv_admin_role" {
#   for_each = azurerm_key_vault.kv

#   scope                = each.value.id
#   role_definition_name = "Key Vault Administrator"
#   principal_id         = "081858cf-269a-463e-a89c-ed2d82a48bde"
#   principal_type       = "ServicePrincipal"
# }