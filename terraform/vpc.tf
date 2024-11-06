# VPC and subnets


resource "aws_vpc" "primary" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

# Create subnets in different AZs
resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.primary.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "${var.aws_region}-a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet 1"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.primary.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "${var.aws_region}-b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet 2"
  }
}

resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.primary.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "${var.aws_region}-a"

  tags = {
    Name = "Private Subnet 1"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.primary.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "${var.aws_region}-b"

  tags = {
    Name = "Private Subnet 2"
  }
}
