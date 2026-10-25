resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-rg"
  location = var.location
  tags     = { project = "aks-gitops-security" }
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                      = "${var.prefix}-aks"
  location                  = azurerm_resource_group.rg.location
  resource_group_name       = azurerm_resource_group.rg.name
  dns_prefix                = var.prefix
  automatic_upgrade_channel = "patch"

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.node_vm_size
    max_pods   = 50
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = { project = "aks-gitops-security" }
}
