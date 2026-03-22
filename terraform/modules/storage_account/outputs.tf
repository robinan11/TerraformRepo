output "storage_account_name" {
  value = azurerm_storage_account.this.name
}

output "storage_account_id" {
  value = azurerm_storage_account.this.id
}

output "iteration" {
  value = var.iteration
}

output "naming" {
  value = {
    location = substr(var.location, 0, 3)
    app      = var.appname
    subapp   = var.subappname
    instance = var.iteration
  }
}
