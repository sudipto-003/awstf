module "lambda_role_policy" {
    source = "../iam_policy"
    
    count = var.create_role && length(var.policy_permissions) != 0 && var.attach_policy ? 1 : 0
    policy_statements = var.policy_permissions
}

module "lambda_role" {
    source = "../iam_role"

    count = var.create_role ? 1 : 0
    role_name = var.role
    assume_role_policy_statements = var.role_trust_permissions

    
    attach_policy = var.attach_policy
    attached_managed_policies = var.attach_managed_policy

    policy_arns = module.lambda_role_policy[*].policy_arn
}


resource "aws_lambda_function" "lambda" {
    role = var.create_role ? one(module.lambda_role[*].role_arn) : var.role

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