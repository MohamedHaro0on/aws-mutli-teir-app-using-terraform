resource "aws_internet_gateway" "main_vpc_igw" {
  vpc_id = aws.vpc.main_vpc.id
  depends_on = [
    aws_vpc.main_vpc
  ]
  tags = {
    Name = "${var.main_vpc.name}-igw"
  }
}