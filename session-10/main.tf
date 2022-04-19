// 1. Terraform Registry
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"

// Variables 
  name = "aws-session-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-1a", "us-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

// 2. Github Public or Private Repositories
module "s3" {
    source = "github.com/aKumoSolutions/terraform-march-2022//modules/s3?ref=v1.0.0"
    env = "dev-test"
}

module "ec2" {
    source = "github.com/aKumoSolutions/terraform-march-2022//modules/ec2"
    env = "dev"
    ami = "ami-04a50faf2a2ec1901"
    instance_type = "t2.micro"
    project = "application"
}

// ?ref=v1.1.0 is a way to reference to the releases and tags

// github.com = domain name
// aKumoSolutions = organization
// terraform-march-2022 = repository
// tree = branches
// main = default branches
// modules = subdirectory
// s3 = subdirectory


