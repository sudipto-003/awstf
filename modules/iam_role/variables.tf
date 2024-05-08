variable "assume_role_policy_statements" {
  type    = list(map(string))
  default = []
  description = "Role assume role trust policy statements, declared as a map of string. Usage:: effect = \"Allow\" or \"Deny\", actions = comma seperated actions in a single string, principals = pipe(|) seperates list of principals, plus(+) seperates the type and identifies of a principal and identifiers are again comma seperated.Extra complexity added for make the structure as a uniform list(map(string))"
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