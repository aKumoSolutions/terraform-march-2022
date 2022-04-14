resource "aws_instance" "my_ec2" {
  count = 1
  ami           =  data.aws_ami.amazon_linux_2.image_id
  instance_type =  var.instance_type   
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  tags = merge(local.common_tags, { Name = replace(local.name, "rtype", "web-ec2") } )
  key_name = aws_key_pair.terraform_server.key_name

  provisioner "file" {
    source = "/home/ec2-user/terraform-march-2022/session-8/index.html" #Where does your file exist? #Terraform Server
    destination = "/tmp/index.html"

    connection {
      type = "ssh"
      user = "ec2-user"
      host = self.public_ip
      private_key = file("~/.ssh/id_rsa")                   # Private key of my Terraform Server
    }
  }
  provisioner "remote-exec" {        # Even in the company, engineers do not run userdata, instead they run CloudInit
      inline = [
        "sudo yum install httpd -y",
        "sudo systemctl start httpd",
        "sudo systemctl enable httpd",
        "sudo cp /tmp/index.html /var/www/html/index.html"
      ]
    connection {
      type = "ssh"
      user = "ec2-user"
      host = self.public_ip
      private_key = file("~/.ssh/id_rsa")                   # Private key of my Terraform Server
    } 
  }
}


resource "aws_key_pair" "terraform_server" {
  key_name = replace(local.name, "rtype", "terraform_server_key")
  public_key = file("~/.ssh/id_rsa.pub")
}