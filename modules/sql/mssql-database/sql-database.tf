resource "azurerm_mssql_database" "terraform-sql-database" {
  name = var.database_name
  server_id = output.sql_server_id.id
  sku_name = "Basic"
  tags = {
    environment = "production"
  }
}