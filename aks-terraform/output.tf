output "aks_kubeconfig" {
  description = "The kubeconfig file for managing the AKS cluster."
  value = module.aks-cluster-module.aks_kubeconfig
  sensitive = true
}