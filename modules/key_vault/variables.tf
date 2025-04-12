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
    kv_sku = optional(string)

    enabled_for_deployment          = optional(bool)
    enabled_for_disk_encryption     = optional(bool)
    enabled_for_template_deployment = optional(bool)
    enable_rbac_authorization       = optional(bool)
    soft_delete_retention_days      = optional(number)
    public_network_access_enabled   = optional(bool)


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