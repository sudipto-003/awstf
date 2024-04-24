output "notun_baltir_name" {
    value = var.baltir_nam != "" ? one(aws_s3_bucket.balti_nam_thik_ache[*].id) : one(aws_s3_bucket.balti_nam_thik_nai[*].id)
    description = "New bucket created by the module"
}

output "notun_baltir_arn" {
    value = var.baltir_nam != "" ? one(aws_s3_bucket.balti_nam_thik_ache[*].arn) : one(aws_s3_bucket.balti_nam_thik_nai[*].arn)
    description = "ARN of new bucket created by the module"
}