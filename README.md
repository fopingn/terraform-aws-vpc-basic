# AWS VPC module for terraform

A lightweight VPC module for Terraform.
## Usage
module "vpc" {
source = "https://github.com/fopingn/terraform-aws-vpc-basic"
name = "vpc_name"
cidr = "10.0.0.0/16"
public_subnet = "10.0.1.0/24"
}
## License
Apache
