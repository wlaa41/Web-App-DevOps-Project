# Main Terraform configuration file

data "azurerm_key_vault" "main" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "client_id" {
  name         = var.client_id_secret_name
  key_vault_id = data.azurerm_key_vault.main.id
}

data "azurerm_key_vault_secret" "client_secret" {
  name         = var.client_secret_secret_name
  key_vault_id = data.azurerm_key_vault.main.id
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

module "networking-module" {
  source = "./modules/networking-module"

  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_address_space  = var.vnet_address_space
  my_ip_address = var.my_ip_address // Add this line to pass the variable to your module

}

module "aks-cluster-module" {
  source = "./modules/aks-cluster-module/"

  aks_cluster_name            = var.aks_cluster_name
  location                    = var.location
  dns_prefix                  = var.dns_prefix
  kubernetes_version          = var.kubernetes_version
  resource_group_name         = module.networking-module.networking_resource_group_name
  client_id                   = data.azurerm_key_vault_secret.client_id.value
  client_secret               = data.azurerm_key_vault_secret.client_secret.value
  vnet_id                     = module.networking-module.vnet_id
  control_plane_subnet_id     = module.networking-module.control_plane_subnet_id
  worker_node_subnet_id       = module.networking-module.worker_node_subnet_id
  aks_nsg_id                  = module.networking-module.aks_nsg_id
}
#   aks_cluster_name            = var.aks_cluster_name
#   location                    = var.location
#   dns_prefix                  = var.dns_prefix
#   kubernetes_version          = var.kubernetes_version
#   resource_group_name         = var.resource_group_name
#   client_id                   = var.client_id
#   client_secret               = var.client_secret
#   vnet_id                     = module.networking-module.vnet_id
#   control_plane_subnet_id     = module.networking-module.control_plane_subnet_id
#   worker_node_subnet_id       = module.networking-module.worker_node_subnet_id
#   aks_nsg_id                  = module.networking.aks_nsg_id

# }
