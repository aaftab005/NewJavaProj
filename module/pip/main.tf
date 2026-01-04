resource "azurerm_public_ip" "pip" {
  for_each = var.pip
  name = each.value.pip_name
  resource_group_name = var.rgcall[each.value.rgkey].name
  location = var.rgcall[each.value.rgkey].location
  allocation_method = each.value.alloc_method
  }

 
