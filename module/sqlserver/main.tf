resource "azurerm_mssql_server" "sqlserver" {
  for_each = var.sqlserver
  name                         = each.value.sqlserver_name
  resource_group_name          = var.sqlserver_call[each.value.serverkey].name
  location                     = var.sqlserver_call[each.value.serverkey].location
  version                      = each.value.ver
  administrator_login          = each.value.admin_login
  administrator_login_password = each.value.admin_pswd
}


resource "azurerm_mssql_database" "sql_db" {
  for_each = var.sql_db
  name         = each.value.db_name
  server_id    = azurerm_mssql_server.sqlserver[each.value.serverkey].id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.size
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type

  tags = {
    foo = "bar"
  }
  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}


