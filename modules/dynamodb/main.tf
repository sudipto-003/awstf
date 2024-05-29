locals {
    attributes = { for s in split(",", var.attributes) : split("::", s)[0] => split("::", s)[1] }
}

resource "aws_dynamodb_table" "this" {
    name = var.table_name

    dynamic "attribute" {
        for_each = keys(local.attributes)

        content {
            name = attribute.value
            type = local.attributes[attribute.value]
        }
    }

    hash_key = var.partition_key
    range_key = var.sort_key

    billing_mode = var.billing_mode
    read_capacity = var.billing_mode == "PROVISIONED" ? var.read_capacity : null
    write_capacity = var.billing_mode == "PROVISIONED" ? var.write_capacity : null

    stream_enabled = var.enable_stream
    stream_view_type = var.enable_stream == true ? var.stream_view : null

    dynamic "global_secondary_index" {
        for_each = var.global_indexes

        content {
            name = global_secondary_index.value._name
            hash_key = global_secondary_index.value._partition_key
            range_key = global_secondary_index.value._sort_key
            read_capacity = var.billing_mode == "PROVISIONED" ? global_secondary_index.value._read_capacity : null
            write_capacity = var.billing_mode == "PROVISIONED" ? global_secondary_index.value._write_capacity : null
            projection_type = global_secondary_index.value._projection
            non_key_attributes = global_secondary_index.value._projection == "INCLUDE" ? split(",", try(global_secondary_index.value._add_attributes, "")) : null
        }
    }

    dynamic "local_secondary_index" {
        for_each = var.local_indexes

        content {
            name = local_secondary_index.value._name
            projection_type = local_secondary_index.value._projection
            range_key = local_secondary_index.value._sort_key
            non_key_attributes = local_secondary_index.value._projection == "INCLUDE" ? split(",", try(local_secondary_index.value._add_attributes, "")) : null
        }
    }

    lifecycle {
        ignore_changes = [ local_secondary_index ]
    }
}