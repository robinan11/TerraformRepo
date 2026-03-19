terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "RobinPOCAI"
    storage_account_name = "aipocrobin"
    container_name       = "tfstate"
    # key is set dynamically via -backend-config in the workflow
  }
}

provider "azurerm" {
  features {}
}

# Extract short ID from request_id (e.g., REQ-92a1b7c2 -> 92a1b7c2)
locals {
  short_id = lower(replace(var.request_id, "REQ-", ""))
  project  = "portal"
  env      = "dev"

  common_tags = {
    request_id = var.request_id
    requester  = var.requester
    approved_by = var.approved_by
    created_by  = "ai-agent"
    managed_by  = "terraform"
  }
}

# Resource Group (always created when deploy_resource_group = true)
module "resource_group" {
  source = "./modules/resource_group"
  count  = var.deploy_resource_group ? 1 : 0

  rg_name  = "rg-ai-${local.project}-${local.env}-${local.short_id}"
  location = var.location
  tags     = local.common_tags
}

# Storage Account (only created when deploy_storage_account = true)
module "storage_account" {
  source = "./modules/storage_account"
  count  = var.deploy_storage_account ? 1 : 0

  storage_account_name     = "stai${local.project}${local.env}${substr(local.short_id, 0, 4)}"
  resource_group_name      = module.resource_group[0].name
  location                 = module.resource_group[0].location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = local.common_tags
}
