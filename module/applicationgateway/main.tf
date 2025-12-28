resource "azurerm_application_gateway" "AppGw" {
  for_each = var.appGw
  name = each.value.lbname
  resource_group_name = var.rgcall[each.value.appgwkey].name
  location = var.rgcall[each.value.appgwkey].location
  sku {
    name     = each.value.sku_name
    tier     = each.value.tier
    capacity = each.value.capacity
  }

  gateway_ip_configuration {
    name      = each.value.gwip_name
    subnet_id = var.subnetcall[each.value.subkey].id
  }

  frontend_port {
    name = each.value.fe_name
    port = each.value.port
  }

  frontend_ip_configuration {
    name                 = each.value.fe_ipname
    public_ip_address_id = var.pipcall[each.value.pipkey].id
  }

  backend_address_pool {
    name = each.value.backsdrs_name
  }

  backend_http_settings {
    name                  = each.value.backhttp_setting
    cookie_based_affinity = each.value.backhttp_cookie
    path                  = each.value.backhttp_path
    port                  = each.value.backhttp_port
    protocol              = each.value.backhttp_protocol
    request_timeout       = each.value.backhttp_reqtimeout
  }

  http_listener {
    name                           = each.value.httplisten_name
    frontend_ip_configuration_name = each.value.httplisten_Fipconfname
    frontend_port_name             = each.value.httplisten_fportname
    protocol                       = each.value.httplisten_protocol
  }

  request_routing_rule {
    name                       = each.value.rrr_name
    priority                   = each.value.rrr_priority 
    rule_type                  = each.value.rrr_ruletype
    http_listener_name         = each.value.httplisten_name
    backend_address_pool_name  = each.value.backsdrs_name
    backend_http_settings_name = each.value.backhttp_setting
  }
}


variable "appGw" {}
variable "rgcall" {}
variable "subnetcall" {}
variable "pipcall" {}

