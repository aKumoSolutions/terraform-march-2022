resource "aws_instance" "first_ec2" {
  ami           = "ami-04a50faf2a2ec1901" #String, Whenever you hard code the values, it uses double quatations 
  instance_type = "t2.micro"
  tags = {
    Name        = "SecondVersionofEC2"
    Environment = "dev"
  }
  security_groups = ["default"]
  key_name        = "MyMacKey"
}

# in JSON, we call it data. In terraform, we call it argument
# Argument = key and value, name and value. 
# Key is predefined by Terraform, value is defined by author (us)
# Terraform has only 2 types of Blocks. Resource and Data source blocks. 
# Each block has its own functionality.
# Resource block is designed to create resources. Data source is designed to fetch the data from existing resource.
# Each block expects 2 labels.
# The first label is predefined by Terraform. It indicates what resource you would like to create. 
# The second label is defined by Author. It indicates the Logical Name or Logical ID for the resources
# Every single resource has to have a unique logical Name or ID

// Class Notes:
// Terraform has a plugin based architecture. 
// Terraform is developed on Programming Language called GO.
// Terraform support many different providers. 
// Terraform is Cloud Agnostic, it can work across multiple Cloud Providers.
// Every Cloud Provider has SDK (Software Development Kit), make an API call to resources.
// Terraform Code - Terraform Runs - Go Runs(Background) - Go does API calls through SDK.

// Terraform Works in the directory. We call it Working Directory

// String = Whatever you see on your keyboard, example: 1, @, a, A, $Tg/as`12
// Number = 1, 2, 3, 4, 5 .... 1000
// Boolean = True, False
// Binary = 0, 1 

// [] = list
// LIST = 
// Example: 
// List of number = [1, 2, 3, 4, 5]
// List of string = [a, abc, ef5, $%^]
// List of Fruit  = [apple, banana, orange, onion]