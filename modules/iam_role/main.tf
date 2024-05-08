data "aws_iam_policy_document" "role_trust_policy" {
  dynamic "statement" {
    for_each = var.assume_role_policy_statements
    content {
      effect  = try(statement.value["effect"], "Allow")
      actions = split(",", try(statement.value["actions"], ""))

      dynamic "principals" {
        for_each = split("|", try(statement.value["principals"], ""))
        content {
          type        = split("+", principals.value)[0]
          identifiers = split(",", split("+", principals.value)[1])
        }
      }
    }
  }
}

data "aws_iam_policy_document" "inline_policy" {
    count = length(var.inline_policies)

    dynamic "statement" {
        for_each = [for inline in var.inline_policies[count.index] : inline]

        content {
            effect = statement.value["effect"]
            actions = split(",", statement.value["actions"])
            resources = split(",", statement.value["resources"])
        }
    }
}

resource "aws_iam_role" "this" {
    name               = var.role_name
    assume_role_policy = data.aws_iam_policy_document.role_trust_policy.json
    force_detach_policies = var.force_detach_policies

    managed_policy_arns = length(var.attached_managed_policies) != 0 && !var.attach_policy ? toset(var.attached_managed_policies) : null

    dynamic "inline_policy" {
        for_each = data.aws_iam_policy_document.inline_policy

        content {
            name = "inline-policy-${inline_policy.key + 1}"
            policy = inline_policy.value.json
        }
    }
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
  count = length(var.attached_managed_policies) == 0 && var.attach_policy ? length(var.policy_arns) : 0

  role = aws_iam_role.this.id
  policy_arn = var.policy_arns[count.index]
}