variable "bucket_name" {
    type = string
    default = ""
}

variable "bucket_create_using_prefix" {
    type = bool
    default = false
}

variable "bucket_tags" {
    type = map(string)
    default = {}
}

variable "object_lock_enabled" {
    type = bool
    default = true
}

variable "bucket_force_destroy" {
    type = bool
    default = true
}