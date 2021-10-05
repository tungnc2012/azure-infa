variable "resource_group_name" {
  description = ""
  default     = ""
}

variable "location" {
  description = ""
  default     = ""
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
  default     = "tfworkspaces"
}

variable "environment" {
  description = ""
  default     = "workspaces"
}

variable "capacity" {
  description = ""
  default     = "5"
}

// variable "default_tags" {
//   description = ""
//   type        = map
//   default     = {}
// }
#Behind is the SQL variables
variable "sql_server_name" {
  description = ""
  default     = "mssqlserver123asdqwe"
}

// variable "version" {
//   description = ""
//   default     = ""
// }

variable "administrator_login" {
  description = ""
  default     = "tungdo"
}

variable "administrator_login_password" {
  description = ""
  default     = "Tung123456"
}

variable "env" {
  description = ""
  default     = "prod"
}

variable "database_name" {
  description = ""
  default     = "sql-database"
}

variable "sa_name" {
  description = ""
  default     = "terrafornsa"
}

variable "account_tier" {
  description = ""
  default     = "Standard"
}

variable "account_replication_type" {
  description = ""
  default     = "GRS"
}

variable "database_edition" {
  description = ""
  default     = "Basic"
}

