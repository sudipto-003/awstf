variable "policy_statements" {
  type    = list(map(any))
  default = [ ]
}

variable "policy_name" {
    type = string
    default = ""
}