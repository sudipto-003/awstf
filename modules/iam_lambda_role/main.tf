data "aws_iam_policy_document" "policy_document" {
  dynamic "statement" {
    for_each = var.policy_statements
    content {
      effect    = try(statement.value[0], "Allow")
      actions   = split(",", try(statement.value[1], ""))
      resources = split(",", try(statement.value[2], ""))
    }
  }
}

resource "aws_iam_policy" "policy" {
  name = "${var.lambda_role}-policy"
  path = "/"

  policy = data.aws_iam_policy_document.policy_document.json
}

data "aws_iam_policy_document" "role_trust_policy" {
  dynamic "statement" {
    for_each = var.trust_statements
    content {
      effect  = try(statement.value[0], "Allow")
      actions = split(",", try(statement.value[1], ""))

      dynamic "principals" {
        for_each = statement.value[2]
        content {
          type        = principals.value[0]
          identifiers = split(",", try(principals.value[1], ""))
        }
      }

    }
  }
}

resource "aws_iam_role" "lambda_role" {
  name               = var.lambda_role
  assume_role_policy = data.aws_iam_policy_document.role_trust_policy.json
}

resource "aws_iam_role_policy_attachment" "lambda_role_attach_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.policy.arn
}