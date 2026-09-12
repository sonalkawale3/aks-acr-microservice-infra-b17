terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  backend "azurerm"{
    resource_group_name  = "blr-rg"
    storage_account_name = "pipeline18batch"
    container_name      = "forb18"
    key = "forb18-state"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "aa773f47-45c8-4cc2-9309-7a5218e5f071"
}