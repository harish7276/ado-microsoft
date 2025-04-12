variable "environment" {}
variable "resource_group_name" {}
variable "location" {}
variable "subnet_id" {}
variable "public_vm_size" {}
variable "private_vm_size" {}
variable "public_key_path" {}
variable "pem_file_path" {}
variable "encoded_path" {}
variable "script_path" {}

variable "vm_name" {
  type        = string
  description = "Name of the Virtual Machine"
}

variable "vm_size" {
  type        = string
  default     = "Standard_B2ms"
}

variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "subnet_id" {
  type        = string
}

variable "admin_username" {
  type        = string
}

variable "admin_password" {
  type        = string
  sensitive   = true
}

variable "tags" {
  type    = map(string)
  default = {}
}
