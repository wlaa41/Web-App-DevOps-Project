output "vnet_id" {
  description = "The ID of the VNet created for the AKS cluster."
  value       = azurerm_virtual_network.aks_vnet.id
}

output "control_plane_subnet_id" {
  description = "The ID of the subnet created for the AKS control plane."
  value       = azurerm_subnet.control_plane_subnet.id
}

output "worker_node_subnet_id" {
  description = "The ID of the subnet created for the AKS worker nodes."
  value       = azurerm_subnet.worker_node_subnet.id
}

output "networking_resource_group_name" {
  description = "The name of the resource group where networking resources are provisioned."
  value       = azurerm_resource_group.aks_rg.name
}

output "aks_nsg_id" {
  description = "The ID of the Network Security Group associated with the AKS cluster."
  value       = azurerm_network_security_group.aks_nsg.id
}
