role_name = "LambdaRole"

policy_statements = [
  ["Allow", "s3:GetObjects,s3:ListObjects", "arn:aws:s3:::test1,arn:aws:s3:::test2"],
  ["Allow", "s3:PutObject", "arn:aws:s3:::test2"]
]

trust_policy_statements = [
  ["Allow", "sts.AssumeRole", [["Service", "lambda.amazonaws.com,ec2.amazon.com"], ["AWS", "arn:aws:iam::000000000000:role/testRole"]]]
]