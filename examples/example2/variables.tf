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

variable "function_config" {
  type = map(any)
}

variable "code_source" {
  type = string
}

variable "s3_info" {
  type = map(string)
}

variable "function_env_vars" {
  type = map(any)
  default = {}
}

variable "function_permissions" {
  type = map(any)
  default = {}
}

variable "source_bucket_name" {
  type = string
}

variable "destination_bucket_name" {
  type = string
}