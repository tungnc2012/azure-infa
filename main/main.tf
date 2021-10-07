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
  database_name    = "terraformmssql"
}

output "sql_server_id" {
    value = module.mssql-server.server_id
}

output "sql_server_name" {
    value =  module.mssql-server.sql_server_name
}

module "mssql-database" {
  source           = "/home/cloud_user/test-modules/modules/sql/mssql-server"
  sql_server_name              = "terraformsqltestfsoft"
  resource_group_name          = "terraform"
  location                     = "southeastasia"
  database_name    = "terraformmssql"
  mssql_version                = "12.0"
  minimum_tls_version          = "1.2"
  sku_name = "Basic"
  sql_server_id = module.mssql-server.server_id
  depends_on       = [module.mssql-server]
}

// #Test VM
// resource "azurerm_resource_group" "resource_group" {
//   name     = "terraform"
//   location = "southeastasia"
// }

// resource "azurerm_virtual_network" "vnet" {
//   resource_group_name = "terraform"
//   location            = "southeastasia"
//   name                = "terraform-vnet"
//   address_space       = ["10.16.0.0/16"]
// }

// resource "azurerm_subnet" "subnet" {
//     name = "terraform-subnet"
//     resource_group_name = "terraform"
//     virtual_network_name = azurerm_virtual_network.vnet.name
//     address_prefixes = ["10.16.0.0/20"]
//    # lookup(map,key,default)  
// }

// output "subnet_id" {
//   value = azurerm_subnet.subnet.id
// }

// resource "azurerm_network_interface" "example" {
//   name                = "example-nic"
//   location            = "southeastasia"
//   resource_group_name = "terraform"

//   ip_configuration {
//     name                          = "internal"
//     subnet_id                     = azurerm_subnet.subnet.id
//     private_ip_address_allocation = "Dynamic"
//   }

// }

// resource "azurerm_windows_virtual_machine" "example" {
//   name                = "example-machine"
//   resource_group_name = "terraform"
//   location            = "southeastasia"
//   size                = "Standard_DS1_v2"
//   admin_username      = "tungdo"  
//   admin_password      = "Tung12345678"
//   network_interface_ids = [azurerm_network_interface.example.id]

//   depends_on = [azurerm_network_interface.example]

//   os_disk {
//     caching              = "ReadWrite"
//     storage_account_type = "Standard_LRS"
//     // disk_size_gb = "32"
//   }

//   source_image_reference {
//     publisher = "MicrosoftWindowsDesktop"
//     offer     = "Windows-10"
//     sku       = "20h1-pro"
//     version   = "latest"
//   }

// }
