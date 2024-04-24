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

module "bucket" {
  source = "../../modules/s3"

  baltir_nam = var.bucket_name
  baltir_tag = var.bucket_tags
  balti_tala_dewa = var.object_lock_enabled
}

output "bucket_arn" {
  value = module.bucket.notun_baltir_arn
}

module "another_bucket" {
  source = "../../modules/s3"

  baltir_prefix_name = var.bucket_prefix_name
  baltir_tag = var.bucket_tags
  balti_tala_dewa = var.object_lock_enabled
}

output "another_bucket_arn" {
  value = module.another_bucket.notun_baltir_arn
}