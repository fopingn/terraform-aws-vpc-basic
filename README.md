# AWS VPC module for terraform

A simple VPC module for Terraform.
## Usage
module "vpc" {
source = "https://github.com/fopingn/terraform-aws-vpc-basic.git"
name = "vpc_name"
cidr = "10.0.0.0/16"
enable_dns_hostnames = true
enable_dns_support = true
public_subnet = "10.0.1.0/24"
public_subnets = ["10.0.20.0/24","10.0.21.0/24","10.0.22.0/24"]
private_subnets = ["10.0.120.0/24","10.0.121.0/24","10.0.122.0/24"]
azs = ["us-east-2a","us-east-2b","us-east-2c"]
tags = {  
      Owner = "user"
      Environment = "dev"
}
vpc_tags = {
  Name = "xxxxx"
  }
igw_tags = {
    Name = "xxxxx"
  }
public_subnet_tags = {
      Name = "public_subnet-xxxxx"
    }
private_subnet_tags = {

        Name = "private_subnet-xxxxx"
      }
}
## License
MIT
