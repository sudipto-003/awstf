provider "aws" {

  access_key = "test"
  secret_key = "test"
  region     = "eu-north-1"

  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    apigateway     = "http://localhost:4566"
    apigatewayv2   = "http://localhost:4566"
    cloudformation = "http://localhost:4566"
    cloudwatch     = "http://localhost:4566"
    dynamodb       = "http://localhost:4566"
    ec2            = "http://localhost:4566"
    es             = "http://localhost:4566"
    elasticache    = "http://localhost:4566"
    firehose       = "http://localhost:4566"
    iam            = "http://localhost:4566"
    kinesis        = "http://localhost:4566"
    lambda         = "http://localhost:4566"
    rds            = "http://localhost:4566"
    redshift       = "http://localhost:4566"
    route53        = "http://localhost:4566"
    s3             = "http://s3.localhost.localstack.cloud:4566"
    secretsmanager = "http://localhost:4566"
    ses            = "http://localhost:4566"
    sns            = "http://localhost:4566"
    sqs            = "http://localhost:4566"
    ssm            = "http://localhost:4566"
    stepfunctions  = "http://localhost:4566"
    sts            = "http://localhost:4566"
  }
}

module "source_bucket" {
  source = "../../modules/s3"

  baltir_nam = var.source_bucket_name
}

module "destination_bucket" {
  source = "../../modules/s3"
  
  baltir_nam = var.destination_bucket_name
}

module "role" {
  source            = "../../modules/iam_lambda_role"
  lambda_role       = var.role_name
  policy_statements = var.policy_statements

  trust_statements = var.trust_policy_statements
}

locals {
  lambda_env_variable = merge(var.function_env_vars, {"DESTINATION_BUCKET" = module.destination_bucket.notun_baltir_name})
  lambda_permissions = merge(var.function_permissions, {"source_arn" = module.source_bucket.notun_baltir_arn})
}

module "lambda_function" {
  source = "../../modules/lambda"

  lambda_role = module.role.role_arn

  code_source = var.code_source
  lambda_config = var.function_config
  lambda_env = local.lambda_env_variable
  s3_source = var.s3_info
  lambda_permissions = local.lambda_permissions
}