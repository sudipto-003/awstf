variable "bucket_name" {
    type = string
    default = ""
}

variable "bucket_prefix_name" {
    type = string
    default = ""
}

variable "bucket_tags" {
    type = map(string)
    default = {}
}

variable "object_lock_enabled" {
    type = bool
    default = true
}