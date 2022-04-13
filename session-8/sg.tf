resource "aws_security_group" "my_sg" {
  name        = replace(local.name, "rtype", "web-sg")
  description = "This is a test security group"
  vpc_id      = "vpc-fc59629b"
  tags = {
      Name = replace(local.name, "rtype", "web-sg")
      Tags = local.common_tags
  }
}

resource "aws_security_group_rule" "ingress_ssh" {
  type              = "ingress" 
  from_port         = 22 
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [ "0.0.0.0/0" ]           # [] = list
  security_group_id = aws_security_group.my_sg.id # first_label.second_label.attribute
}

resource "aws_security_group_rule" "ingress_web" {
  type              = "ingress" 
  from_port         = 80 
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [ "0.0.0.0/0" ]           # [] = list
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