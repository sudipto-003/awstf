assume_role_policy_statements =  [
  {"effect" = "Allow", "actions" = "sts.AssumeRole,s3:GetObject", "principals" = "Service+lambda.amazonaws.com,ec2.amazonaws.com|AWS+arn:aws:iam::111122223333:role/demoRole|Federated+arn:aws:iam::111122223333:saml-provider/demoProvider,cognito-identity.amazonaws.com"},
]

role_name = "test_role"

inline_policies = [ 
    [{"effect" : "Allow", "actions": "ec2:Describe", "resources": "*"}, {"effect": "Allow", "actions": "s3:GetObject", "resources": "*"}],
    [{"effect": "Allow", "actions": "ec2:DescribeAccountAttributes", "resources": "*"}]
 ]

policy_statements = [
  {effect = "Allow", actions = "s3:GetObject,s3:ListObject", resources = "*"},
  {effect = "Allow", actions = "s3:PutObject", resources = "*"}
]