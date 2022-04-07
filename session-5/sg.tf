resource "aws_security_group" "my_sg" {
  name        = "SecurityGroup"
  description = "This is a test security group"
  vpc_id      = "vpc-fc59629b"
}

resource "aws_security_group_rule" "ingress_ssh" {
  count = 3 
  type              = "ingress" #Hard Coded
  from_port         = element(var.ec2_inbound_rules, count.index )    // count.index = 0, 1, 2   count = 3 
  to_port           = element(var.ec2_inbound_rules, count.index )
  protocol          = "tcp"
  cidr_blocks       = [element(var.ec2_inbound_rules_cidr, count.index)]           # [] = list
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