locals {
  # Normalize & trim
  location_short = substr(lower(var.location), 0, 3)
  app_short      = substr(lower(var.appname), 0, 3)
  subapp_short   = substr(lower(var.subappname), 0, 5)

  # Final naming convention (no hyphens — Azure storage accounts: lowercase alphanumeric, max 24 chars)
  # Format: locappsubappiterationsa
  sa_name = "${local.location_short}${local.app_short}${local.subapp_short}${var.iteration}sa"

  default_tags = {
    app       = var.appname
    subapp    = var.subappname
    iteration = var.iteration
  }

  final_tags = merge(local.default_tags, var.tags)
}

resource "azurerm_storage_account" "this" {
  name                     = local.sa_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  tags                     = local.final_tags
}
