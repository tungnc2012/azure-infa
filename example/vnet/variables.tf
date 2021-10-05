variable "resource_group_name" {
  description = ""
  default     = "tung-terraform"
}

variable "location" {
  description = ""
  default     = "southeastasia"
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
