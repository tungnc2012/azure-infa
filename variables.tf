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
  default     = "10.16.0.0/16"
}

variable "subnet_name" {
  description = ""
  default     = ""
}

variable "subnet" {
  description = ""
  default     = "10.16.0.0/20"
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