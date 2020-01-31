terraform {
  required_version = ">= 0.12, < 0.13"
}

resource "aws_vpc" "simple_vpc" {
  cidr_block           = var.cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  tags = {
    key = "Name"
    value = var.name
  }
}

resource "aws_internet_gateway" "simple_vpc_igw" {
  vpc_id = aws_vpc.simple_vpc.id
  tags = {
    key = "Name"
    value = "${var.name}-igw"
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_vpc.simple_vpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.simple_vpc_igw.id
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.simple_vpc.id
  cidr_block = var.public_subnet

  tags = {
    key = "Name"
    value = "${var.name}-public"
  }
}
