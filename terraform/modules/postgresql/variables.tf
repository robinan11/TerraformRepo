variable "server_name" {
  description = "Name of the PostgreSQL Flexible Server (must be globally unique)"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group to deploy into"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "centralindia"
}

variable "postgresql_version" {
  description = "PostgreSQL major version"
  type        = string
  default     = "16"
}

variable "admin_username" {
  description = "Administrator login name"
  type        = string
  default     = "pgadmin"
}

variable "sku_name" {
  description = "SKU name (tier_computeSize). Burstable B1ms is cheapest."
  type        = string
  default     = "B_Standard_B1ms"
}

variable "storage_mb" {
  description = "Storage size in MB (minimum 32768 = 32 GB)"
  type        = number
  default     = 32768
}

variable "backup_retention_days" {
  description = "Backup retention in days (7-35)"
  type        = number
  default     = 7
}

variable "geo_redundant_backup" {
  description = "Enable geo-redundant backups"
  type        = bool
  default     = false
}

variable "availability_zone" {
  description = "Availability zone (1, 2, or 3). Set to null for no preference."
  type        = string
  default     = "1"
}

variable "database_name" {
  description = "Name of the application database to create"
  type        = string
  default     = "agentdb"
}

variable "client_ip" {
  description = "Client IP address to allow through firewall (for local dev). Leave empty to skip."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
