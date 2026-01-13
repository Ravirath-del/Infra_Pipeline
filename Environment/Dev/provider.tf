terraform {
  required_providers {
    azurerm = {
      version = "4.49.0"
      source  = "hashicorp/azurerm"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "1b05e470-de80-481a-8feb-07829124ebd9"
}