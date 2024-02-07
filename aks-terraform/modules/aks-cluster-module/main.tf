# aks-cluster-module//modules/aks-cluster-module/main.tf file

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = var.location
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version
  resource_group_name = var.resource_group_name

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
    vnet_subnet_id = var.worker_node_subnet_id
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }
  tags = {
    Environment = "production"
  }

  network_profile {
    network_plugin = "azure"
    service_cidr   = "10.1.0.0/16"  // An example CIDR that does not overlap with your subnets
    dns_service_ip = "10.1.0.10"    // Must be within the service_cidr
  }
}
