variable "name" {
  description = "The Name of this Resource Group."
  type        = string
}

variable "timeouts" {
  type = object({
    read = optional(string)
  })
  default = null
}

variable "include_role_assignments" {
  type    = bool
  default = false
}

variable "include_locks" {
  type    = bool
  default = false
}
