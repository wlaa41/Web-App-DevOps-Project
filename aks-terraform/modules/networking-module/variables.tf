variable "resource_group_name" {
  description = <<EOF
  Defines the Azure Resource Group's name where networking resources are deployed.
  EOF
  type        = string
  default     = "networking-resources-group"
}

variable "location" {
  description = <<EOF
  Specifies the geographic location where the networking resources will be deployed.
  EOF
  type        = string
  default     = "East US"
}

variable "vnet_address_space" {
  description = <<EOF
  Defines the IP address range for the Virtual Network, specifying available IP addresses within the VNet.
  EOF
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
