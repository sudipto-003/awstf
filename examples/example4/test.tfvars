table_name = "TestTable"
attributes = "Name::S,Age::N,Id::S,Designation::S"
partion_key = "Name"
sort_key = "Age"

enable_stream = false
stream_type = "NEW_AND_OLD_IMAGES"

gsis = [ {
    _name = "IdIndex"
    _partition_key = "Id"
    _sort_key = "Designation"
    _read_capacity = 8
    _write_capacity = 3
    _projection = "KEYS_ONLY"
    _add_attributes = "Salary,Experience"
} ]

lsis = [ {
    _name = "DesignationIndex"
    _sort_key = "Designation"
    _projection = "INCLUDE"
    _add_attributes = "Age,Experience"
} ]