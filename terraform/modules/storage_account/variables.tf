variable "storage_account_name" {
  description = "Globally unique storage account name"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "account_tier" {
  description = "Storage account tier"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Replication type"
  type        = string
  default     = "LRS"
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
