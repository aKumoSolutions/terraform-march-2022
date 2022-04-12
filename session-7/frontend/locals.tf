locals {
  name = "aws-${var.stage}-${var.region}-${var.env}-${var.project}-rtype"
  
  common_tags = {
    env = var.env
    PROJECT = var.project
    TEAM = "Cloud"
    OWNER = "Kris"
    Managed_by = "Terraform"
  }
}


replace( local.name, "rtype" "ALB")
replace( local.name, "rtype" "ASG")

// Every company has a naming convention for the resources
// 1. Naming standard and tagging standard
// Naming Standard 

// 1. What Cloud Provider = aws
// 2. What is the environment = non-prod, prod
// 3. What is the specific env = dev, qa, stage
// 4. What is the region = us-west-1, us-east-1
// 5. What is the project ? = matrix 

// Standard = aws-nonprod-us-west-2-dev-matrix-${resource}

// Tagging Standard (Common Tags)
// 1. environment
// 2. project
// 3. TEAM
// 4. owner
// 5. managed by = Terraform