variable "policy_statements" {
  type    = list(list(string))
  default = [[]]
}

variable "trust_statements" {
  type    = list(any)
  default = []
}

variable "lambda_role" {
  type    = string
  default = "LambdaRole"
}
