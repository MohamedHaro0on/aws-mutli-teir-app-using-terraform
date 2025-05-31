
variable "front_end_servers" {
    description = "list of the front end servers to be created in the main vpc"
    type = list (object ({
        name = string,
        instance_type = string,
    }))
}

variable "back_end_servers" {
    description = "list of the backend servers to be created in the main vpc"
    type = list (object ({
        name = string,
        instance_type = string, 
    }))
}
