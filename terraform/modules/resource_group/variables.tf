variable "appname" {
  type        = string
  description = "Application name (max 3 chars)"

  validation {
    condition     = length(var.appname) <= 3 && can(regex("^[a-z0-9]+$", var.appname))
    error_message = "appname must be <= 3 chars and lowercase alphanumeric."
  }
}

variable "subappname" {
  type        = string
  description = "Sub application name (max 5 chars)"

  validation {
    condition     = length(var.subappname) <= 5 && can(regex("^[a-z0-9]+$", var.subappname))
    error_message = "subappname must be <= 5 chars and lowercase alphanumeric."
  }
}

variable "location" {
  type        = string
  description = "Azure region"

  validation {
    condition     = length(var.location) >= 3
    error_message = "location must be at least 3 characters."
  }
}

variable "iteration" {
  type        = string
  description = "Instance number (e.g., 01, 02, 03)"

  validation {
    condition     = can(regex("^[0-9]{2}$", var.iteration))
    error_message = "iteration must be a 2-digit number like 01, 02, 03."
  }
}

variable "tags" {
  type    = map(string)
  default = {}
}