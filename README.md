# AWS VPC module for terraform

A lightweight VPC module for Terraform.
## Usage
module "vpc" {
source = "github.com/fopingn/vpc-basic-tf"
name = "vpc_name"
cidr = "10.0.0.0/16"
public_subnet = "10.0.1.0/24"
}
See `interface.tf` for additional configurable variables.
## License
Apache
