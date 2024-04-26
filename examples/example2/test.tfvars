role_name = "LambdaRole"

policy_statements = [
  ["Allow", "s3:GetObjects,s3:ListObjects", "arn:aws:s3:::test1,arn:aws:s3:::test2"],
  ["Allow", "s3:PutObject", "arn:aws:s3:::test2"]
]

trust_policy_statements = [
  ["Allow", "sts.AssumeRole", [["Service", "lambda.amazonaws.com,ec2.amazon.com"], ["AWS", "arn:aws:iam::000000000000:role/testRole"]]]
]

code_source = "s3"

function_config = {
  "function_name" = "testLambda"
  "handler" = "lambda_fight.fear_fight"
}

function_env_vars = {
  "UPLOAD_FILE_PREFIX" = "fear"
  "WORD_TO_REPLACE" = "fight"
  "REPLACEMENT_WORD" = "fear"
}

s3_info = {
  "bucket" = "lambdasource"
  "key" = "lambda_fight"
}

function_permissions = {
  "action" = "lambda:InvokeFunction"
  "principal" = "s3.amazonaws.com"
  "source_account" = "000000000000"
}

source_bucket_name = "red"
destination_bucket_name = "green"