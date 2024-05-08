variable "create_role" {
    type = bool
    default = false
}

variable "role" {
    type = string
    nullable = false
}

variable "policy_permissions" {
    type = list(map(any))
    default = [ ]
}

variable "role_trust_permissions" {
    type = list(any)
    default = [ ]   
}

variable "attach_policy" {
    type = bool
    default = true
}

variable "attach_managed_policy" {
    type = list(string)
    default = [  ]
}

variable "lambda_config" {
    type = map(any)
    default = {
      "function_name" = "test"
      "handler" = "lambda_function.lambda_handler"
    }  
}

variable "lambda_env" {
    type = map(any)
    default = {}
}

variable "code_source" {
    type = string
    default = "s3"
}

variable "filename" {
    type = string
    default = ""
}

variable "s3_source" {
    type = map(string)
    default = {
      "bucket" = "sourceBucket"
      "key" = "lambdafunction"
    }
}

variable "lambda_permissions" {
    type = map(any)
    default = {
      "action" = "lambda:InvokeFunction"
      "principal" = "s3.amazonaws.com"
      "source_account" = 111122223333
      "source_arn" = "arn:aws:xyz::111122223333:abc/def"
    }
}