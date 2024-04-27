variable "bucket_to_set_notifications" {
    type = string
}

variable "lambda_functions" {
    type = list(map(string))
    default = [ ]
}

variable "queues" {
    type = list(map(string))
    default = [ ]
}

variable "topics" {
    type = list(map(string))
    default = [ ]
}