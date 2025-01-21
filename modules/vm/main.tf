# Create virtual machine
resource "azurerm_linux_virtual_machine" "my_terraform_vm" {
  name                  = "myVM"
  location              = var.rg_location
  resource_group_name   = var.rg_name
  network_interface_ids = [var.nic_id]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name  = "hostname"

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.ssh_public_key)
  }
  # admin_username = var.admin_username
  # admin_password = var.admin_password

  # disable_password_authentication = false
}
