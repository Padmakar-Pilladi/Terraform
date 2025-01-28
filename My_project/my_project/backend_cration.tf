
# Backend Configuration (usually in a separate backend.tf file)
terraform {
  backend "s3" {
     bucket = "myprojectpracticeonworkspace1234" 

    key            = "paddu/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "paddu_terraform-lock"
  }
}
