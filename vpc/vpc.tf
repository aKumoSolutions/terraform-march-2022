resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = var.instance_tenancy
  tags = merge(
    var.tags,
    {
      Name = "VPC"
    }
  )
}