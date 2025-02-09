provider "aws" {
  
  region = "us-east-1"
}

# S3 Bucket for storing Terraform state
resource "aws_s3_bucket" "padmakar" {
  bucket = "devopsb15s3bucketforpadmakar" 
  tags = {
    Name = "padmakar"
  }
}

# DynamoDB table for state locking
resource "aws_dynamodb_table" "terraform_lock" {
  name         = "paddu_terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}