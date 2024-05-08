variable "assume_role_policy_statements" {
  type    = list(any)
  default = []
}

variable "role_name" {
  type    = string
  default = "demoRole"
}

variable "inline_policies" {
    type = list(any)
    default = [  ]
}

variable "force_detach_policies" {
    type = bool
    default = true
}

variable "attached_managed_policies" {
    type = list(string)
    default = [ ]
}

variable "attach_policy" {
  type = bool
  default = false
}

variable "policy_arns" {
  type = list(string)
  default = [  ]
}