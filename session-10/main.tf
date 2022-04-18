// 1. Terraform Registry
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"
}