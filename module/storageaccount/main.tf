resource "azurerm_storage_account" "Storageaccnt" {
      for_each = var.sa
      name = each.value.name
      location = var.gg[each.value.kk].location
      resource_group_name = var.gg[each.value.kk].name
      account_tier = each.value.at
      account_replication_type = each.value.acctype
}

