resource "aws_nat_gateway" "main_vpc_nat_gw" {
    allocation_id = aws_eip.main_vpc_eip.id
    subnet_id     = aws_subnet.public_subnet_list[var.nat_gateway_subnet].id
    depends_on    = [
        aws_internet_gateway.main_vpc_igw,
        aws_subnet.main_vpc_public_subnet
    ]
    tags = {
        Name = "${var.main_vpc.name}-nat-gw"
    }
}