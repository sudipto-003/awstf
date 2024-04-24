# What is done in this example?

We defined a module to create s3 buckets. Here resource aws_s3_bucket has two conflicting arguments bucket and bucket_prefix, so our module is designed to create a s3 bucket either bucket name or bucket prefix name is passed through but it will explicitly failed if try to provide both or none of these variables. Howerever the bucket is created with name or prefix name, it will return the newly created bucket id and arn through common output variable.

In this example it is shown to create s3 bucket using our tf module.