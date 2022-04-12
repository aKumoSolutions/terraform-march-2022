terraform {
    backend "s3" {
        bucket = "terraform-march-2022-backend-bucket-do-not-delete"
        key = "session-7/backend/terraform.tfstate"
        region = "us-west-1"
        dynamodb_table = "terraform-march-2022-lock"
    }
}
