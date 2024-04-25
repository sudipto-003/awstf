resource "aws_lambda_function" "lambda" {
    role = var.lambda_role

    function_name = var.lambda_config["function_name"]
    handler = var.lambda_config["handler"]
    package_type = "Zip"

    memory_size = lookup(var.lambda_config, "memory_size", 128)
    runtime = lookup(var.lambda_config, "runtime", "python3.11")
    timeout = lookup(var.lambda_config, "timeout", 3)

    s3_bucket = var.code_source == "s3" ? var.s3_source["bucket"] : null
    s3_key = var.code_source == "s3" ? var.s3_source["key"] : null
    s3_object_version = var.code_source == "s3" ? lookup(var.s3_source, "object_version", null) : null

    filename = var.code_source == "local" ? var.filename : null

    environment {
        variables = length(var.lambda_env) > 0 ? var.lambda_env : null
    }
}

resource "aws_lambda_permission" "function_permission" {
    function_name = aws_lambda_function.lambda.function_name

    statement_id = lookup(var.lambda_permissions, "statement_id", null)
    principal = var.lambda_permissions["principal"]
    action = var.lambda_permissions["action"]
    source_arn = var.lambda_permissions["source_arn"]
    source_account = var.lambda_permissions["source_account"]
}