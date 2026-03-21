terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

# Generate a random password for the admin user
resource "random_password" "db_password" {
  length           = 24
  special          = true
  override_special = "!#$%&*()-_=+[]{}:?"
  min_lower        = 2
  min_upper        = 2
  min_numeric      = 2
  min_special      = 2
}

# Azure Database for PostgreSQL - Flexible Server
resource "azurerm_postgresql_flexible_server" "this" {
  name                          = var.server_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = var.postgresql_version
  administrator_login           = var.admin_username
  administrator_password        = random_password.db_password.result
  sku_name                      = var.sku_name
  storage_mb                    = var.storage_mb
  backup_retention_days         = var.backup_retention_days
  geo_redundant_backup_enabled  = var.geo_redundant_backup
  zone                          = var.availability_zone

  tags = var.tags
}

# Firewall rule — allow Azure services
resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_azure" {
  name             = "AllowAzureServices"
  server_id        = azurerm_postgresql_flexible_server.this.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

# Firewall rule — allow client IP (for local dev)
resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_client" {
  count            = var.client_ip != "" ? 1 : 0
  name             = "AllowClientIP"
  server_id        = azurerm_postgresql_flexible_server.this.id
  start_ip_address = var.client_ip
  end_ip_address   = var.client_ip
}

# Create the application database
resource "azurerm_postgresql_flexible_server_database" "app_db" {
  name      = var.database_name
  server_id = azurerm_postgresql_flexible_server.this.id
  charset   = "UTF8"
  collation = "en_US.utf8"
}
