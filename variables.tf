variable "region" {
  description = "region of aws"
  default     = "us-east-2"
}
variable "name" {
  description = "The name of the VPC."
}
variable "cidr" {
  description = "The CIDR of the VPC."
}
variable "enable_dns_hostnames" {
  description = "Should be true if you want to use private DNS within the VPC"
  }
variable "enable_dns_support" {
  description = "Should be true if you want to use private DNS within the VPC"
  }
variable "public_subnet_suffix" {
    description = "Suffix to append to public subnets name"
    type        = string
    default     = "public"
  }
variable "private_subnet_suffix" {
    description = "Suffix to append to private subnets name"
    type        = string
    default     = "private"
  }
variable "public_subnets" {
    description = "A list of public subnets inside the VPC"
    type        = list(string)
    default     = []
  }
variable "private_subnets" {
    description = "A list of private subnets inside the VPC"
    type        = list(string)
    default     = []
  }
variable "azs" {
    description = "A list of availability zones in the region"
    type        = list(string)
    default     = []
  }
  variable "tags" {
    description = "A map of tags to add to all resources"
    type        = map(string)
    default     = {}
  }

  variable "vpc_tags" {
    description = "Additional tags for the VPC"
    type        = map(string)
    default     = {}
  }
  variable "igw_tags" {
    description = "Additional tags for the internet gateway"
    type        = map(string)
    default     = {}
  }

  variable "public_subnet_tags" {
    description = "Additional tags for the public subnets"
    type        = map(string)
    default     = {}
  }

  variable "private_subnet_tags" {
    description = "Additional tags for the private subnets"
    type        = map(string)
    default     = {}
  }
