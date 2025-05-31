resource "aws_route_table" "main_vpc_public_route_table" {
  vpc_id = aws_vpc.main_vpc.id
  route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_vpc_igw.id
  }
  tags = {
    Name = "${var.main_vpc.name}-public-route-table"
  }
}
resource "aws_route_table" "main_vpc_private_route_table" {
  vpc_id = aws_vpc.main_vpc.id
    route = {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.main_vpc_nat_gw.id
    }
  tags = {
    Name = "${var.main_vpc.name}-private-route-table"
  }
}


