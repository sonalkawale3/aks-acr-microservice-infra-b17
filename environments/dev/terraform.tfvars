infra_config = {
  resource_groups = {
    "rg-micro-prod" = {
      location = "East US"
      tags     = { Environment = "Dev", ManagedBy = "Terraform" }
    }
  }
  container_registries = {
    "acrmicrodev5678123" = {
      rg_key = "rg-micro-prod"
      sku    = "Basic"
    }
  }
  kubernetes_clusters = {
    "aks-micro-dev" = {
      rg_key     = "rg-micro-prod"
      dns_prefix = "aksmicrodev"
      default_node_pool = {
        name       = "default"
        node_count = 2
        vm_size    = "standard_d2ads_v7"
      }
    }
  }
}
