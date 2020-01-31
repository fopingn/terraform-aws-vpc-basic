# AWS VPC module for terraform

A lightweight VPC module for Terraform.
## Usage
module "vpc" {
source = "https://github.com/fopingn/terraform-aws-vpc-basic.git"
name = "vpc_name"
cidr = "10.0.0.0/16"
enable_dns_hostnames = true
enable_dns_support = true
public_subnet = "10.0.1.0/24"

}
## License
MIT
