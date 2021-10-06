resource "azurerm_mssql_server" "server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password   
  version = var.mssql_version
  minimum_tls_version = var.minimum_tls_version

  tags = {
    environment = var.env
  }
}

resource "azurerm_mssql_database" "database" {
  name = var.database_name
  server_id = azurerm_mssql_server.server.id
  sku_name = "Basic"
  tags = {
    environment = "production"
  }
}
