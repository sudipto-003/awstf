variable "assume_role_policy_statements" {
  type    = list(map(string))
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

variable "policy_statements" {
  type = list(map(any))
  default = [ ]
}