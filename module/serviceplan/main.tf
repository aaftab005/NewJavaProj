resource "azurerm_app_service_plan" "srvplan" {
      for_each = var.srvplan
      name =  each.value.srvplanname
      location = var.srvplancall[each.value.spkey].location
      resource_group_name = var.srvplancall[each.value.spkey].name 
      kind = "Linux"
      reserved = true
    sku {
    tier = each.value.tier
    size = each.value.size
  }
}


