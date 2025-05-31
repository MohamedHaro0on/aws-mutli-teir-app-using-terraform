resource "aws_security_group" "bastion_host_sg" {
  name        = "${var.main_vpc.name}-bastion-host-sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/8"]
  
  }
}

resource "aws_security_group" "external_load_balancer_sg" {
  name        = "${var.main_vpc.name}-external-load-balancer-sg"
  description = "Allow port 3000 inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/8"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/8"]
  }
}



resource "aws_security_group" "front_end_instances_sg" {
  name        = "${var.main_vpc.name}-front-end-instances-sg"
  description = "Allow port 3000 inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/8"]
    security_groups = [aws_security_group.external_load_balancer_sg.id]
  }
    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws.vpc.main_vpc.cidr_block]
    security_groups = [aws_security_group.bastion_host_sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/8"]
  }
}

resource "aws_security_group" "internal_load_balancer_sg" {
  name        = "${var.main_vpc.name}-internal-load-balancer-sg"
  description = "Allow port 3000 inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [aws.vpc.main_vpc.cidr_block]
    security_groups = [aws_security_group.front_end_instances_sg.id]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws.vpc.main_vpc.cidr_block]
    security_groups = [aws_security_group.bastion_host_sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/8"]
  }
}

resource "aws_security_group" "back_end_instances_sg" {
  name        = "${var.main_vpc.name}-back-end-instances-sg"
  description = "Allow port 3000 inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [aws.vpc.main_vpc.cidr_block]
    security_groups = [aws_security_group.internal_load_balancer_sg.id]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws.vpc.main_vpc.cidr_block]
    security_groups = [aws_security_group.bastion_host_sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/8"]
  }
}

resource "aws_security_group" "documentDB_sg" {
  name        = "${var.main_vpc.name}-documentdb-sg"
  description = "Allow DocumentDB inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = [aws.vpc.main_vpc.cidr_block]
    security_groups = [aws_security_group.back_end_instances_sg.id]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/8"]
  }
}