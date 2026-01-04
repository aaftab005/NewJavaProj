resource "azurerm_subnet" "subnet" {
  for_each = var.subnet
  name = each.value.subnetname
  virtual_network_name = var.subnetcall[each.value.snkey].name
  resource_group_name = var.subnetcall[each.value.snkey].location 
  address_prefixes = each.value.adrspac
}

