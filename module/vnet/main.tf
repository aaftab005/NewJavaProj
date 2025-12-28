resource "azurerm_virtual_network" "vnet"{
     for_each = var.vnet
     name = each.value.vnetname
     resource_group_name = var.vnetcall[each.value.aa].name
     location = var.vnetcall[each.value.aa].location
     address_space = each.value.adddrsspace
}

variable "vnet" {}
variable "vnetcall"{}
