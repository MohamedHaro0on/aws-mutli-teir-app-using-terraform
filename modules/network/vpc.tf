resource "aws_vpc" "main" {
    cidr_block = var.main_vpc.cidr_block
    enable_dns_hostnames =  true 
    enable_dns_support = true
    instance_tenancy = var.main_vpc.tenancy
    tags = {
        Name = var.main_vpc.name
    }
}