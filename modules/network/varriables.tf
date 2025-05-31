variable "main_vpc" {
    description = "Main VPC Configuration"
    type = object ({
        cidr_block = string,
        name = string,
        tenancy = string, 
    })
}

variable "public_subnet_list" {
    description = "List of public subnets to be created in the Main VPC"
    type = list (object ({
        cidr_block = string,
        availability_zone = string,
        name = string,
        map_public_ip_on_launch = bool
    }))
}

variable "private_subnet_list" {
    description = "List of private subnets to be created in the Main VPC"
    type = list (object ({
        cidr_block = string,
        availability_zone = string,
        name = string,
        map_public_ip_on_launch = bool
    }))
}

variable "nat_gateway_subnet" {
    description = "Subnet for NAT Gateway"
    type = string
}
variable "bastion_host_subnet" {
    description = "Subnet for Bastion Host"
    type = string   
}

variable "external_load_balancer_subnet" {
    description = "Subnet for External Load Balancer"
    type = string
}

variable "front_end_subnets" {
    description = "List of subnets for Front End Services"
    type = list (string)
}

variable "back_end_subnets" {
    description = "List of subnets for Back End Services"
    type = list (string)
}

variable "internal_load_balancer_subnets" {
    description = "List of subnets for Internal Load Balancer"
    type = list (string)
}

variable "documentDB_subnets" {
    description = "List of subnets for DocumentDB"
    type = list (string)
}