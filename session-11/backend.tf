terraform {
    backend "s3" {
        bucket = "terraform-march-2022-backend-bucket-do-not-delete"
        key = "terraform.tfstate"
        region = "us-west-1"
        dynamodb_table = "terraform-march-2022-lock"
        workspace_key_prefix = "session-11"
    }
}