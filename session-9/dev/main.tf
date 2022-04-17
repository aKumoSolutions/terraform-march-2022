# Terraform Local module which consists of Child and Root modules

module "ec2" {
    source = "../../modules/ec2"      #Local or Remote, when it is a Local Module, you provide a path of the Child Module
    # You can declare your variables as a configuration
    ami = "ami-04a50faf2a2ec1901"
    instance_type = "t2.micro"
    env = "dev"
    project = "app-1"
    s3_bucket_name = module.s3.s3_bucket_name
}

#Local and Remote means the way you are calling or sourcing  the modules

#Root module is where you run the Terraform init, plan and apply commands directly

#Child is module is where you declare your resources

module "s3" {
    source = "../../modules/s3"
    env = "dev"
}

# Reference to Resource = first_label.second_label.attribute
# Reference to Module   = ? 


// Whenever you reference to Module, it reference to outputs directly