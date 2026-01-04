output "outputsqlserver" {
  value = azurerm_mssql_server.sqlserver
}

output "outputsqldb" {
  value = azurerm_mssql_database.sql_db
}