resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
}

resource "azurerm_management_lock" "lock-example" {
  name               = "lock-f"
  scope              = azurerm_resource_group.rg.id
  lock_level         = "CanNotDelete"  # You can choose "ReadOnly" or "CanNotDelete"
  notes              = "Locking resource group to prevent accidental deletion"
}
