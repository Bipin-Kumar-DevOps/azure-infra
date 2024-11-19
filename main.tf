terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.10.0"
    }
  }
}

provider "azurerm" {
 features {}
 subscription_id = "da18d9ba-ba9f-46e2-b1af-22a8c3399b76"
}


resource "azurerm_resource_group" "rgs" {
  name     = "test-rg"
  location = "Southeast Asia "
}

resource "azurerm_container_registry" "acrs" {
  name                = "bkcontainerreg247"
  resource_group_name = azurerm_resource_group.rgs.name
  location            = azurerm_resource_group.rgs.location
  sku                 = "Premium"
  admin_enabled       = true
}
