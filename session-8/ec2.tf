resource "aws_instance" "my_ec2" {
  count = 1
  ami           =  data.aws_ami.amazon_linux_2.image_id
  instance_type =  var.instance_type   
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  user_data = file("user_data.sh")

  tags = merge(local.common_tags, { Name = replace(local.name, "rtype", "web-ec2") } )
}