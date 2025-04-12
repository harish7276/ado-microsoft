variable "resource_group_name" {
  description = "Resource group for the Key Vault"
}
variable "location" {
  description = "Azure location where resources should be deployed."
}

variable "tags" {
  description = "Tags for the resources created by this module."
  default     = null
}


variable "key_vaults" {
  description = "Define the key vaults to be created"
  type = map(object({
    name   = string
    kv_sku = optional(string, "standard")

    enabled_for_deployment          = optional(bool, false)
    enabled_for_disk_encryption     = optional(bool, false)
    enabled_for_template_deployment = optional(bool, false)
    enable_rbac_authorization       = optional(bool, true)
    soft_delete_retention_days      = optional(number, 7)
    public_network_access_enabled   = optional(bool, true)


    network_acls = optional(object({
      bypass                     = string,
      default_action             = string,
      ip_rules                   = list(string),
      virtual_network_subnet_ids = list(string),
    }))

    access_policy = list(object({
      object_id               = string,
      certificate_permissions = list(string),
      key_permissions         = list(string),
      secret_permissions      = list(string),
      storage_permissions     = list(string),
    }))
  }))
  default = null
}