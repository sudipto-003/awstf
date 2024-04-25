variable "lambda_role" {
    type = string
    nullable = false
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