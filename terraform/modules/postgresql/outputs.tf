output "server_fqdn" {
  description = "Fully qualified domain name of the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.this.fqdn
}

output "server_id" {
  description = "Resource ID of the PostgreSQL Flexible Server"
  value       = azurerm_postgresql_flexible_server.this.id
}

output "database_name" {
  description = "Name of the application database"
  value       = azurerm_postgresql_flexible_server_database.app_db.name
}

output "admin_username" {
  description = "Administrator login name"
  value       = azurerm_postgresql_flexible_server.this.administrator_login
}

output "admin_password" {
  description = "Administrator password (sensitive)"
  value       = random_password.db_password.result
  sensitive   = true
}

output "connection_string" {
  description = "PostgreSQL connection string for the app (sensitive)"
  value       = "postgresql://${azurerm_postgresql_flexible_server.this.administrator_login}:${random_password.db_password.result}@${azurerm_postgresql_flexible_server.this.fqdn}:5432/${azurerm_postgresql_flexible_server_database.app_db.name}?sslmode=require"
  sensitive   = true
}
