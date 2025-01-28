#vpc_cidr
variable "vpc_cidr_block" {
    default = "10.81.0.0/16"

  
}

  


#subnet_cidr
variable "sn_cidr_block" {
    default = "10.81.1.0/24"
}


#private_ips
variable "private_ips" {
    default = ["10.81.1.33"]
  
}
#eip_association

variable "eip_association_with_private_ip" {
    default = "10.81.1.33"
  
}

#instance
variable "ami" {
    default = "ami-0df8c184d5f6ae949"
  
}
variable "instance_type" {
    default = "t2.micro"
  
}
variable "key_name" {
    default = "aws"
  
}
variable "Name" {
    default = "Paddu"
  
}


# Variables definition for s3 and dynamodb
variable "aws_s3_bucket" {
  description = "The name of the S3 bucket for Terraform state"
  default     = "devopsengineercloud"
}

variable "aws_dynamodb_table" {
  description = "The name of the DynamoDB table for Terraform state locking"
  default     = "terraform-lock"
}