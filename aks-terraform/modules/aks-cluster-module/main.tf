# Within the cluster-module's main.tf file

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = var.cluster_location
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
    client_id     = var.service_principal_client_id
    client_secret = var.service_principal_secret
  }

  tags = {
    Environment = "production"
  }
}

