aws_region = "us-east-1"

main_vpc = {
    cidr_block = "10.0.0.0/16"
    tenancy = "default"
    name = "main_vpc"
}

public_subnet_list = [ 
    {
        cidr_block = "10.0.0.0/24"
        name = "private_subnet_1"
        availability_zone = "us-east-1a"
        map_public_ip_on_launch = true
    },
    {
        cidr_block = "10.0.1.0/24"
        name = "private_subnet_2"
        availability_zone = "us-east-1b"
        map_public_ip_on_launch = true
    },
    {
        cidr_block = "10.0.2.0/24"
        name = "private_subnet_3"
        availability_zone = "us-east-1c"
        map_public_ip_on_launch = true
    },
]


private_subnet_list = [ 
    {
        cidr_block = "10.0.3.0/24"
        name = "private_subnet_1"
        availability_zone = "us-east-1a"
        map_public_ip_on_launch = false
    },
    {
        cidr_block = "10.0.4.0/24"
        name = "private_subnet_2"
        availability_zone = "us-east-1b"
        map_public_ip_on_launch = false
    },
    {
        cidr_block = "10.0.5.0/24"
        name = "private_subnet_3"
        availability_zone = "us-east-1c"
        map_public_ip_on_launch = false
    },
    {
        cidr_block = "10.0.6.0/24"
        name = "private_subnet_4"
        availability_zone = "us-east-1a"
        map_public_ip_on_launch = false
    },
    {
        cidr_block = "10.0.7.0/24"
        name = "private_subnet_5"
        availability_zone = "us-east-1b"
        map_public_ip_on_launch = false
    },
    {
        cidr_block = "10.0.8.0/24"
        name = "private_subnet_6"
        availability_zone = "us-east-1c"
        map_public_ip_on_launch = false
    },
    {
        cidr_block = "10.0.9.0/24"
        name = "private_subnet_7"
        availability_zone = "us-east-1a"
        map_public_ip_on_launch = false
    },
    {
        cidr_block = "10.0.10.0/24"
        name = "private_subnet_8"
        availability_zone = "us-east-1b"
        map_public_ip_on_launch = false
    },
    {
        cidr_block = "10.0.11.0/24"
        name = "private_subnet_9"
        availability_zone = "us-east-1c"
        map_public_ip_on_launch = false
    },
    {
        cidr_block = "10.0.12.0/24"
        name = "private_subnet_10"
        availability_zone = "us-east-1a"
        map_public_ip_on_launch = false
    },
    {
        cidr_block = "10.0.13.0/24"
        name = "private_subnet_11"
        availability_zone = "us-east-1b"
        map_public_ip_on_launch = false
    },
    {
        cidr_block = "10.0.14.0/24"
        name = "private_subnet_12"
        availability_zone = "us-east-1c"
        map_public_ip_on_launch = false
    },
]

nat_gateway_subnet = "public_subnet_1"
bastion_host_subnet = "public_subnet_2"
external_load_balancer_subnet = "public_subnet_3"
front_end_subnets = [
    "private_subnet_1",
    "private_subnet_2",
    "private_subnet_3"
]

internal_load_balancer_subnets = [
    "private_subnet_4",
    "private_subnet_5",
    "private_subnet_6",
]

back_end_subnets = [
    "private_subnet_7",
    "private_subnet_8",
    "private_subnet_9"
]
documentDB_subnets = [
    "private_subnet_10",
    "private_subnet_11",
    "private_subnet_12"
]
# This file defines the variables for the AWS VPC and subnets configuration.
# It includes the main VPC configuration, public and private subnets, and specific subnets for various services.