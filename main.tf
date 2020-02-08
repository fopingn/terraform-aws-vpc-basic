terraform {
  required_version = ">= 0.12, < 0.13"
}
################
# VPC
################
resource "aws_vpc" "this" {
  cidr_block           = var.cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  tags = merge(
  {
    "Name" = format("%s", var.name)
  },
  var.tags,
  var.vpc_tags,
)
}

####################
# Internet Gateway
####################
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = merge(
  {
    "Name" = format("%s", var.name)
  },
  var.tags,
  var.igw_tags,
)
}

################
# Public route
################
resource "aws_route" "public_internet_route" {
  route_table_id         = aws_vpc.this.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

################
# Public subnet
################
resource "aws_subnet" "public" {
  count = length(var.public_subnets)

  vpc_id                          = aws_vpc.this.id
  cidr_block                      = element(concat(var.public_subnets, [""]), count.index)
  availability_zone               = element(var.azs, count.index)

    tags = merge(
    {
      "Name" = format(
        "%s-${var.public_subnet_suffix}-%s",
        var.name,
        element(var.azs, count.index),
      )
    },
    var.tags,
    var.public_subnet_tags,
  )
}

#################
# Private subnet
#################
resource "aws_subnet" "private" {
  count = length(var.private_subnets)

  vpc_id                          = aws_vpc.this.id
  cidr_block                      = var.private_subnets[count.index]
  availability_zone               = element(var.azs, count.index)
  tags = merge(
    {
      "Name" = format(
        "%s-${var.private_subnet_suffix}-%s",
        var.name,
        element(var.azs, count.index),
      )
    },
    var.tags,
    var.private_subnet_tags,
  )
}
