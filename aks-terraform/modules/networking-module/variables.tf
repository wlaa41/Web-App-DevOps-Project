variable "resource_group_name" {
  description = "Defines the Azure Resource Group's name where networking resources are deployed."
  type        = string
  default     = "networking-resource-group"
}

variable "location" {
  description = "Specifies the geographic location where the networking resources will be deployed."
  type        = string
  default     = "UK South"
}

variable "vnet_address_space" {
  description = "Defines the IP address range for the Virtual Network, specifying available IP addresses within the VNet."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "my_ip_address" {
  description = "My public IP address for security rules"
  type        = string
  // No default value is set to ensure that it is provided explicitly for security reasons.
}
