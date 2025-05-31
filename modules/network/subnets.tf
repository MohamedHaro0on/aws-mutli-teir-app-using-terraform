resource "aws_subnet" "subnets"{
    for_each = {
        for subnet in var.public_subnet_list : subnet.name => subnet
    }
    cidr_block = each.value.cidr_block
    vpc_id = aws_vpc.main_vpc.id
    availability_zone = each.value.availability_zone
    map_public_ip_on_launch = each.value.map_public_ip_on_launch
    
    tags = {
        Name = "${var.main_vpc.name}-${each.value.name}"
    }
}

resource "aws_subnet" "subnets"{
    for_each = {
        for subnet in var.private_subnet_list : subnet.name => subnet
    }
    cidr_block = each.value.cidr_block
    vpc_id = aws_vpc.main_vpc.id
    availability_zone = each.value.availability_zone
    map_public_ip_on_launch = each.value.map_public_ip_on_launch
    
    tags = {
        Name = "${var.main_vpc.name}-${each.value.name}"
    }
}
