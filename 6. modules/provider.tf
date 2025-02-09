provider "aws" {
    region = "us-east-1" 
}

module "vpc_module" {
    source = "./main_file"

     ami = "ami-0df8c184d5f6ae949"
    instance_type = "t3.micro"
    key_name = "aws"
    
    
  
}
    