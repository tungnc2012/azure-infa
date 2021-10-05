terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }

  required_version = ">= 0.14.9"
}
provider "azurerm" {
  features {}
}

modules "resource_group" {
  source = "/home/cloud_user/test-modules/modules/rg"
  resource_group_name = "terraform"
  location = "southeastasia"
}

module "storage_account" {
  source = "/home/cloud_user/test-modules/modules/storage-account"
  resource_group_name = module.resource_group.resource_group_name
  location = module.resource_group.location
  storage_account_name = "terraform-storage-account"
  account_tier = "Standard"
  account_replication_type = "LRS"
}

module "vnet" {
  source              = "/home/cloud_user/test-modules/modules/vnet"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.location
  vnet_name           = "terraform-vnet"
  address_space       = ["10.16.0.0/16"]
  subnets = {

    frontend = {
      name   = "frontend"
      prefix = ["10.16.0.0/20"]

    }

    backend = {
      name   = "backend"
      prefix = ["10.16.16.0/20"]
    }
  }
}

module "sql-server" {
  source                       = "/home/cloud_user/test-modules/modules/sql"
  sql_server_name              = "terraformsqltestasdadcaff"
  resource_group_name          = azurerm_resource_group.resource_group.name
  location                     = var.location
  administrator_login          = "tungdo"
  administrator_login_password = "Tung123456"
  depends_on = [azurerm_resource_group.resource_group]
}

// module "sql-database" {
//   source = "/home/cloud_user/test-modules/modules/sql"
//   database_name = var.database_name
//   resource_group_name = var.resource_group_name 
//   location = var.location 
//   sql_server_name = var.sql_server_name
//   database_edition = "Basic"

//   depends_on = [azurerm_resource_group.resource_group]
// }

