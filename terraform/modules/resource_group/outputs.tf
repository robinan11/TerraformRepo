output "resource_group_name" {
  value = azurerm_resource_group.this.name
}

output "resource_group_id" {
  value = azurerm_resource_group.this.id
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