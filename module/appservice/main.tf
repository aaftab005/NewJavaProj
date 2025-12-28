resource "azurerm_app_service" "appsrv1" {
  for_each = var.appsrv
  name = each.value.servname
  location = var.srvcall[each.value.srvkey].location
  resource_group_name = var.srvcall[each.value.srvkey].name
  app_service_plan_id = var.srviplncall[each.value.srplnkey].id
}


