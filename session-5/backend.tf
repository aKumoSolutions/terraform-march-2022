terraform {
    backend "s3" {
        bucket = "terraform-march-2022-backend-bucket-do-not-delete"
        key = "session-5/terraform.tfstate"
        region = "us-west-1"
        dynamodb_table = "terraform-march-2022-lock"
    }
}

# Remote backend is a plugin. Plugin is a feature
# You cannot pass or use any variables for Backend Configuration. 
# We use Terraform Lock = DynamoDB Table