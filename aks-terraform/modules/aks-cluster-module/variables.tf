# main
variable "client_id" {
  description = "The Client Secret for the service principal."
  type        = string
}

variable "client_secret" {
  description = "The Client Secret for the service principal."
  type        = string
}



variable "aks_cluster_name" {
  description = "The name of the AKS cluster to be created."
  type        = string
}

variable "location" {
  description = "The Azure region where the AKS cluster will be deployed."
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

# Output variables from the networking module, used as input variables for this module.
variable "resource_group_name" {
  description = "The name of the Azure Resource Group where the AKS cluster will be provisioned."
  type        = string
}

variable "vnet_id" {
  description = "The ID of the VNet that the AKS cluster will be associated with."
  type        = string
}

variable "control_plane_subnet_id" {
  description = "The ID of the subnet within the VNet for the AKS cluster control plane."
  type        = string
}

variable "worker_node_subnet_id" {
  description = "The ID of the subnet within the VNet for the AKS cluster worker nodes."
  type        = string
}

variable "aks_nsg_id" {
  description = "The ID of the Network Security Group associated with the AKS cluster."
  type        = string
}