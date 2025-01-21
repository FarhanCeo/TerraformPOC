# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  backend "azurerm" {
      resource_group_name  = "Terraform_stuff_F"
      storage_account_name = "terraformstatefilepoc"
      container_name       = "tfstate-file"
      key                  = "terraform.tfstate"
    }

  required_version = ">= 1.1.0"
}
#############Above good to have

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# Resource Group Module
module "resource_group" {
  source       = ".//modules//resource_group"
  rg_name      = var.rg_name
  rg_location  = var.rg_location
}

# Network Module
module "network" {
  source         = ".//modules//network"
  vnet_name      = var.vnet_name
  vnet_address   = var.vnet_address
  subnet_name    = var.subnet_name
  subnet_address = var.subnet_address
  rg_name        = module.resource_group.rg_name
  rg_location    = module.resource_group.rg_location
  public_ip_name = var.public_ip_name
}

# VM Module
module "vm" {
  source             = ".//modules//vm"
  vm_name            = var.vm_name
  vm_size            = var.vm_size
  admin_username     = var.vm_username
  admin_password     = var.vm_password
  subnet_id          = module.network.subnet_id
  rg_name            = module.resource_group.rg_name
  rg_location        = module.resource_group.rg_location
  nic_id             = module.network.nic_id
}
