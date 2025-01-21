output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "nic_id" {
  value = azurerm_network_interface.example.id
}

output "public_ip" {
  value = azurerm_public_ip.example.ip_address
}

