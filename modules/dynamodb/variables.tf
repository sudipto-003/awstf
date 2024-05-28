variable "table_name" {
    type = string
    nullable = false
}

variable "partition_key" {
    type = string
}

variable "sort_key" {
    type = string
}

variable "attributes" {
    type = string
    default = "UserId::S,Name::S,Age::N"
    description = "Comma Seperated values for table attributes. Attribute name and type are concated with double colon(::)"
}

variable "billing_mode" {
    type = string
    default = "PROVISIONED"
}

variable "read_capacity" {
    type = number
    default = 10
}

variable "write_capacity" {
    type = number
    default = 5
}

variable "enable_stream" {
    type = bool
    default = false
}

variable "stream_view" {
    type = string
    default = "NEW_IMAGE"
}

variable "global_indexes" {
    type = list(object({
        _name = string
        _partition_key = string
        _sort_key = string
        _read_capacity = number
        _write_capacity = number
        _projection = string
        _add_attributes = string
    }))
    default = [ ]
}

variable "local_indexes" {
    type = list(object({
        _name = string
        _add_attributes = string
        _sort_key = string
        _projection = string 
    }))
    default = [  ]
}
