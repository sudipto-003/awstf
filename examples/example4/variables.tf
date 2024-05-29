variable "table_name" {
    type = string
}

variable "attributes" {
    type = string
}

variable "partion_key" {
    type = string
}

variable "sort_key" {
    type = string
}

variable "gsis" {
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

variable "lsis" {
    type = list(object({
        _name = string
        _add_attributes = string
        _sort_key = string
        _projection = string 
    }))
    default = [  ]
}

variable "enable_stream" {
    type = bool
    default = false
}

variable "stream_type" {
    type = string
    nullable = true
}