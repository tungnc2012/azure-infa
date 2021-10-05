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

resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
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
