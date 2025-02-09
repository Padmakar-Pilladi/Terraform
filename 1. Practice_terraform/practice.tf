provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "test_server" {
    ami = "ami-0df8c184d5f6ae949"
    instance_type = "t2.micro"
    key_name = "aws"
    tags = {
        Name = "test_server"
    }
  
}