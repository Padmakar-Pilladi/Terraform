
provider "aws" {

    region = "us-east-1"
    alias = "nv"
}

provider "aws" {

    region = "eu-north-1"
    alias  = "mumbai" 
}

resource "aws_instance" "nv_server" {
  
  ami = "ami-0df8c184d5f6ae949"
  instance_type = "t2.micro"
  key_name = "aws"
  provider = aws.nv

  tags = {
    Name = "nv_server"
  }
}

resource "aws_instance" "mum_server" {
  
  ami = "ami-09423ec3aa48e9438"
  instance_type = "t3.micro"
  
  provider = aws.mumbai

  tags = {
    Name = "mum_server"
  }
}