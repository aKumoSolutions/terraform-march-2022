resource "aws_instance" "main" {
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = var.security_groupd_ids
    tags = {
        Name = "${var.env}-instance"
        Environment = var.env
        Project = var.project
    }
}