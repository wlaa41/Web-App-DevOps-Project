# main
variable "client_id" {
  description = "The Client Secret for the service principal."
  type        = string
}

variable "client_secret" {
  description = "The Client Secret for the service principal."
  type        = string
}

variable "subscription_id" {
  description = "The Subscription ID for the Azure services."
  type        = string
}

variable "tenant_id" {
  description = "The Tenant ID for the Azure services."
  type        = string
}




# AKS cluster

variable "aks_cluster_name" {
  description = "The name of the AKS cluster to be created."
  type        = string
}


variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster, which forms part of the cluster's fully qualified domain name."
  type        = string
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to use for the AKS cluster."
  type        = string
}




variable "resource_group_name" {
  description = "The name of the Azure Resource Group where the AKS cluster will be provisioned."
  type        = string
}

variable "location" {
  description = "Specifies the geographic location where the networking resources will be deployed."
  type        = string
}

variable "vnet_address_space" {
  description = "Defines the IP address range for the Virtual Network, specifying available IP addresses within the VNet."
  type        = list(string)
  default     = ["10.0.0.0/16"]

}

# The following variables are likely required by the networking-module based on the outputs you've specified.
variable "control_plane_subnet_id" {
  description = "The ID of the subnet within the VNet for the AKS cluster control plane."
  type        = string
}

variable "worker_node_subnet_id" {
  description = "The ID of the subnet within the VNet for the AKS cluster worker nodes."
  type        = string
}

# Variables for Network Security Group rules if they are needed as inputs to your modules

variable "aks_nsg_id" {
  description = "The nsg id"
  type        = string
}

variable "my_ip_address" {
  description = "The public IP address allowed to access the resources."
  type        = string
}

variable "key_vault_name" {
  description = "The name of the Azure Key Vault"
  type        = string
}

variable "client_id_secret_name" {
  description = "The name of the secret in Azure Key Vault that stores the service principal client ID"
  type        = string
}

variable "client_secret_secret_name" {
  description = "The name of the secret in Azure Key Vault that stores the service principal client secret"
  type        = string
}
