provider "azurerm" {
  features {}
  # ... other configurations ...
}


resource "azurerm_resource_group" "aks_rg" {

  name     = var.resource_group_name
  location = var.location
  tags  = {
    "Purpose" = "AKS Networking"
  }
}

resource "azurerm_virtual_network" "aks_vnet" {
  name                = "aks-vnet"
  address_space      = var.vnet_address_space
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  tags = {
    "Environment" = "Kubernetes"
  }
}

resource "azurerm_subnet" "control_plane_subnet" {
  name                 = "control-plane-subnet"
  resource_group_name  = azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "worker_node_subnet" {
  name                 = "worker-node-subnet"
  resource_group_name  = azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_security_group" "aks_nsg" {
  name                = "aks-nsg"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name

  tags = {
    "Usage" = "AKS Security"
  }
}

# Separate resource for the Kubernetes API server rule
resource "azurerm_network_security_rule" "kube_apiserver_rule" {
  name                        = "kube-apiserver-rule"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "6443"
  source_address_prefix       = "${var.my_ip_address}/32" # Replace with your public IP This refers to the subnet mask length. In CIDR (Classless Inter-Domain Routing) notation, /32 means all 32 bits are used to identify the unique IP address, leaving no bits for the host portion. Therefore, a /32 subnet mask specifies a single IP address.
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.aks_nsg.name
  resource_group_name         = azurerm_resource_group.aks_rg.name
}

# Separate resource for the SSH rule
resource "azurerm_network_security_rule" "ssh_rule" {
  name                        = "ssh-rule"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "${var.my_ip_address}/32" # Replace with your public IP This refers to the subnet mask length. In CIDR (Classless Inter-Domain Routing) notation, /32 means all 32 bits are used to identify the unique IP address, leaving no bits for the host portion. Therefore, a /32 subnet mask specifies a single IP address.
  destination_address_prefix  = "*"
  description                 = "Allow inbound SSH traffic from a specific IP for management"
  network_security_group_name = azurerm_network_security_group.aks_nsg.name
  resource_group_name         = azurerm_resource_group.aks_rg.name
}
