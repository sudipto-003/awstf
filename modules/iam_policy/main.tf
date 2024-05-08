data "aws_iam_policy_document" "policy_document" {
  dynamic "statement" {
    for_each = var.policy_statements
    content {
      effect    = try(statement.value["effect"], "Allow")
      actions   = split(",", try(statement.value["actions"], ""))
      resources = split(",", try(statement.value["resources"], ""))
    }
  }
}

resource "aws_iam_policy" "policy" {
  name = var.policy_name != "" ? var.policy_name : null
  path = "/"

  policy = data.aws_iam_policy_document.policy_document.json
}