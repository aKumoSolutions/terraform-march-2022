data "aws_ami" "amazon_linux_2" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0*"]
  }
  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}

// aws_ami.amazon_linux_2.id = Terraform thinks it is a resourse
// data.aws_ami.amazon_linux_2.id = Terraform thinks it is data source

# Fetch the data from an existing resource, data can be any attribute that resource