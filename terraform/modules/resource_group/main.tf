locals {
  # Normalize & trim
  location_short = substr(lower(var.location), 0, 3)
  app_short      = substr(lower(var.appname), 0, 3)
  subapp_short   = substr(lower(var.subappname), 0, 5)

  # Final naming convention
  # Format: loc-app-subapp-iteration-rg
  rg_name = "${local.location_short}-${local.app_short}-${local.subapp_short}-${var.iteration}-rg"

  default_tags = {
    app       = var.appname
    subapp    = var.subappname
    iteration = var.iteration
  }

  final_tags = merge(local.default_tags, var.tags)
}

resource "azurerm_resource_group" "this" {
  name     = local.rg_name
  location = var.location
  tags     = local.final_tags
}