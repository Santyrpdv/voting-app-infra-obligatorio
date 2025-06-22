

# VPC
resource "aws_vpc" "main_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.project_name}-${var.environment}-VPC"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "${var.project_name}-${var.environment}-IGW"
  }
}


# Public Subnet
resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-${var.environment}-PublicSubnet1"
  }
}
resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-${var.environment}-PublicSubnet2"
  }
}

# Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-PublicRT"
  }
}

resource "aws_route_table_association" "public_subnet1_rt_association" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "public_subnet2_rt_association" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_rt.id
}



# Private Subnet
resource "aws_subnet" "private_app_subnet1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.project_name}-${var.environment}-Private-app-Subnet1"
  }
}
resource "aws_subnet" "private_app_subnet2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.project_name}-${var.environment}-Private-app-Subnet2"
  }
}
resource "aws_subnet" "private_data_subnet1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.project_name}-${var.environment}-Private-data-Subnet1"
  }
}

resource "aws_subnet" "private_data_subnet2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.project_name}-${var.environment}-Private-data-Subnet2"
  }
}
