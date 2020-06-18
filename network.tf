# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "tf-example"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "r1a" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "r1b" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "my_subnet_1a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.1.0/24"
  availability_zone = "ap-southeast-2a"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "my_subnet_1b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.2.0/24"
  availability_zone = "ap-southeast-2b"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_route_table_association" "rta_1a" {
  subnet_id      = aws_subnet.my_subnet_1a.id
  route_table_id = aws_route_table.r1a.id
}

resource "aws_route_table_association" "rta_1b" {
  subnet_id      = aws_subnet.my_subnet_1b.id
  route_table_id = aws_route_table.r1b.id
}