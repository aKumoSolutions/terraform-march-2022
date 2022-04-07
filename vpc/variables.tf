# Providers variables
variable "aws_region" {
  type        = string
  default     = "us-west-1"
}

# VPC variables
variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_tenancy" {
  type        = string
default = "default"
}


variable "rt_cidr_block" {
  type        = string
  default = "0.0.0.0/0"
}

# Subnet variables
variable "subnet_azs" {
  type        = list(string)
  default = [ "us-west-1a", "us-west-1b", "us-west-1c"]
}

variable "pub_cidr_subnet" {
  type        = list(string)
  default = [ "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "priv_cidr_subnet" {
  type        = list(string)
  default = [ "10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
}
