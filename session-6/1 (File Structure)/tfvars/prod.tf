ami = "ami-04a50faf2a2ec1901"
instance_type = "m4.large"
env = "prod"
web_sg_ports = ["22", "80"]
web_sg_ports_cidr = [ "0.0.0.0/0", "0.0.0.0/0" ]