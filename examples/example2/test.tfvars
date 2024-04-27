role_name = "LambdaRole"

policy_statements = [
  ["Allow", "s3:GetObject,s3:ListObject"],
  ["Allow", "s3:PutObject"]
]

trust_policy_statements = [
  ["Allow", "sts.AssumeRole", [["Service", "lambda.amazonaws.com"]]]
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