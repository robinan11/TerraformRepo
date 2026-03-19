variable "request_id" {
  description = "Infrastructure request ID (e.g., REQ-92a1b7c2)"
  type        = string
}

variable "requester" {
  description = "Email of the user who submitted the request"
  type        = string
}

variable "approved_by" {
  description = "Email of the approver"
  type        = string
}

variable "request_message" {
  description = "Original infrastructure request description"
  type        = string
}

variable "location" {
  description = "Azure region for resource deployment"
  type        = string
  default     = "centralindia"
}

variable "deploy_resource_group" {
  description = "Whether to create a resource group"
  type        = bool
  default     = true
}

variable "deploy_storage_account" {
  description = "Whether to create a storage account"
  type        = bool
  default     = false
}
