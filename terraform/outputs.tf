output "resource_group_name" {
  value = var.deploy_resource_group ? module.resource_group[0].name : null
}

output "resource_group_id" {
  value = var.deploy_resource_group ? module.resource_group[0].id : null
}

output "storage_account_name" {
  value = var.deploy_storage_account ? module.storage_account[0].name : null
}

output "storage_account_id" {
  value = var.deploy_storage_account ? module.storage_account[0].id : null
}
