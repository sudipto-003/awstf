resource "aws_s3_bucket" "bucket" {
    bucket = var.bucket_using_prefix == false ? var.bucket_name : null
    bucket_prefix = var.bucket_using_prefix == true ? var.bucket_name : null

    force_destroy = var.bucket_force_destroy
    object_lock_enabled = var.bucket_object_lock
    tags = var.bucket_tags
}