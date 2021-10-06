variable "resource_group_name" {
}

variable "location" {
}

variable "address_space" {
  description = ""
  default     = ""
}

variable "subnet_name" {
  description = ""
  default     = ""
}

variable "subnet" {
  description = ""
  default     = ""
}

variable "application" {
  description = ""
  default     = ""
}

variable "environment" {
  description = ""
  default     = ""
}

variable "capacity" {
  description = ""
  default     = ""
}

#Behind is the SQL variables
variable "sql_server_name" {
}

variable "administrator_login" {
  description = ""
  default     = ""
}

variable "administrator_login_password" {
  description = ""
  default     = ""
}

variable "env" {
  description = ""
  default     = ""
}

variable "database_name" {
}

variable "sa_name" {
  description = ""
  default     = ""
}

variable "account_tier" {
  description = ""
  default     = ""
}

variable "account_replication_type" {
  description = ""
  default     = ""
}

variable "database_edition" {
  description = ""
  default     = ""
}

variable "storage_endpoint" {
  description = ""
  default     = ""
}

variable "storage_account_access_key" {
  description = ""
  default     = ""
}

variable "mssql_version" {
}

variable "minimum_tls_version" {
}

variable "storage_account_access_key_is_secondary" {
  description = ""
  default     = ""
}

variable "sku_name" {
  description = ""
  default     = ""
}

variable "sql_server_id" {
  description = ""
  default     = ""
}
