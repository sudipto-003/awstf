variable "policy_statements" {
  type    = list(list(string))
  default = null
}

variable "trust_policy_statements" {
  type    = list(any)
  default = []
}

variable "role_name" {
  type    = string
  default = "Role"
}