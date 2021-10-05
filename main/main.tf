terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.79.1"
    }
  }
}
provider "azurerm" {
  features {}
}

module "resource_group" {
  source              = "/home/cloud_user/test-modules/modules/rg"
  resource_group_name = "terraform"
  location            = "southeastasia"
}

module "storage_account" {
  source                   = "/home/cloud_user/test-modules/modules/storage-account"
  resource_group_name      = "terraform"
  location                 = "southeastasia"
  storage_account_name     = "terraformtungdtfsoft"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on               = [module.resource_group]
}

module "vnet" {
  source              = "/home/cloud_user/test-modules/modules/vnet"
  resource_group_name = "terraform"
  location            = "southeastasia"
  vnet_name           = "terraform-vnet"
  address_space       = ["10.16.0.0/16"]
  depends_on          = [module.resource_group]
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

module "mssql-server" {
  source                       = "/home/cloud_user/test-modules/modules/sql/mssql-server"
  sql_server_name              = "terraformsqltestfsoft"
  resource_group_name          = "terraform"
  location                     = "southeastasia"
  administrator_login          = "tungdo"
  administrator_login_password = "Tung123456"
  depends_on                   = [module.resource_group]
  mssql_version                = "12.0"
  minimum_tls_version          = "1.2"
}

// module "mssql_database" {
//   source           = "/home/cloud_user/test-modules/modules/sql/mssql-database"
//   database_name    = "terraformmssql"
//   sku_name = "Basic"
//   server_id = module.mssql-server.sql_server_id
//   depends_on       = [module.mssql-server]
// }


