resource "aws_security_group" "my_sg" {
  name        = "SecurityGroup"
  description = "This is a test security group"
  vpc_id      = "vpc-fc59629b"
}

resource "aws_security_group_rule" "ingress_ssh" {
  type              = "ingress" #Hard Coded
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]               # [] = list
  security_group_id = aws_security_group.my_sg.id # first_label.second_label.attribute
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.my_sg.id
}

#Reference is a dynamic action 

# terraform.tfstate is called backend file. 
# terraform.tfstate or backend file keeps track of your infrastructure.
# terraform.tfstate is in charge of keeping Terraform idempotent. 