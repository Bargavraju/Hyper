terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
}

provider "azurerm" {
  features{}
  subscription_id = "455c3b60-50c3-47d1-9e54-ec046e2686b9"
}
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
}
resource "azurerm_virtual_network" "vnet" {
    name                = var.vnet_name
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    address_space       = [var.vnet_address_space]
}
resource "azurerm_subnet" "subnet" {
    name                  = var.subnet_name
    resource_group_name   = azurerm_resource_group.rg.name
    virtual_network_name  = azurerm_virtual_network.vnet.name
    address_prefixes      = [var.subnet_address_prefix]
}
resource "azurerm_network_interface" "nic" {
    name                  = var.nic_name
    location              = var.rg_location
    resource_group_name   = azurerm_resource_group.rg.name

    ip_configuration {
      name                          = var.ip_name
      subnet_id                     = azurerm_subnet.subnet.id
      private_ip_address_allocation = "Dynamic"
    }
}