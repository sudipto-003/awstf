resource "aws_s3_bucket_notification" "notifications" {
    bucket = var.bucket_to_set_notifications

    dynamic "lambda_function" {
        for_each = var.lambda_functions
        content {
            lambda_function_arn = lambda_function.value["arn"]
            events = split(",", lambda_function.value["events"])
            id = lookup(lambda_function.value, "id", null)
            filter_prefix = lookup(lambda_function.value, "filter_prefix", null)
            filter_suffix = lookup(lambda_function.value, "filter_suffix", null)
        }
    }

    dynamic "queue" {
        for_each = var.queues
        content {
            queue_arn = queue.value["arn"]
            events = split(",", queue.value["events"])
            id = lookup(queue.value, "id", null)
            filter_prefix = lookup(queue.value, "filter_prefix", null)
            filter_suffix = lookup(queue.value, "filter_suffix", null)
        }
    }

    dynamic "topic" {
        for_each = var.topics
        content {
            topic_arn = topic.value["arn"]
            events = split(",", topic.value["events"])
            id = lookup(topic.value, "id", null)
            filter_prefix = lookup(topic.value, "filter_prefix", null)
            filter_suffix = lookup(topic.value, "filter_suffix", null)
        }
    }
}