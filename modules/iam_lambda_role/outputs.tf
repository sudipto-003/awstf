output "role_arn" {
  value       = aws_iam_role.lambda_role.arn
  description = "ARN of the role to used in Lambda functions"
}