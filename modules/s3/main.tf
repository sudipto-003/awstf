resource "aws_s3_bucket" "balti_nam_thik_ache" {
    count = var.baltir_nam != "" ? 1 : 0

    bucket = var.baltir_nam
    force_destroy = var.age_balti_khali_pore_destroy
    object_lock_enabled = var.balti_tala_dewa

    tags = var.baltir_tag

    lifecycle {
        precondition {
            condition = ((var.baltir_nam != "" && var.baltir_prefix_name == "") || (var.baltir_nam == "" && var.baltir_prefix_name != "")) == true
            error_message = "Eiher define baltir_nam or baltir_prefix_name. Don't define both or none of this variable."
        }

        ignore_changes = [ object_lock_enabled ]
    }
}

resource "aws_s3_bucket" "balti_nam_thik_nai" {
    count = var.baltir_prefix_name != "" ? 1 : 0

    bucket_prefix = var.baltir_prefix_name
    force_destroy = var.age_balti_khali_pore_destroy
    object_lock_enabled = var.balti_tala_dewa

    tags = var.baltir_tag

    lifecycle {
        precondition {
            condition = ((var.baltir_nam != "" && var.baltir_prefix_name == "") || (var.baltir_nam == "" && var.baltir_prefix_name != "")) == true
            error_message = "Eiher define baltir_nam or baltir_prefix_name. Don't define both or none of this variable."
        }

        ignore_changes = [ object_lock_enabled ]
    }
}