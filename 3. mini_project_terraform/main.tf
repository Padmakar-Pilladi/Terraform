provider "aws" {
    region = "us-east-1" 
}

# 1) creating VPC
resource "aws_vpc" "dev_vpc" {
    cidr_block = "10.81.0.0/16"
    instance_tenancy = "default"
    tags = {
        Name = "dev_vpc"
    }
}

# 2) creating Internetgateway
resource "aws_internet_gateway" "dev_igw" {
    vpc_id = aws_vpc.dev_vpc.id
    tags = {
        Name = "dev_igw"
    }
}

# 3)creating Route table
resource "aws_route_table" "dev_rt" {
    vpc_id = aws_vpc.dev_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.dev_igw.id
        
        }
    tags = {
        Name = "dev_rt"
    }
  
}

# 4) creating subnet - 10.81.1.0/24
resource "aws_subnet" "dev_sn" {
    vpc_id = aws_vpc.dev_vpc.id
    cidr_block = "10.81.1.0/24"
    tags = {
        Name = "dev_sn"
    }
}

# 5 ) Associate subnet to route table

resource "aws_route_table_association" "dev_rta" {
    subnet_id = aws_subnet.dev_sn.id
    route_table_id = aws_route_table.dev_rt.id
  
}

# 6) create security grouprovider 

resource "aws_security_group" "dev_sg" {
    vpc_id = aws_vpc.dev_vpc.id
    description = "Dev Security Group"

    #ingress -inbound

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  tags = {
    Name = "dev_sg"
  }
}

 # 7) creating Network interface to the subnet 

 resource "aws_network_interface" "dev_nic" {

    subnet_id = aws_subnet.dev_sn.id
    private_ips = ["10.81.1.33"]
    security_groups = [aws_security_group.dev_sg.id]
   tags = {
     Name = "Dev_nic"
   }
 }

 # 8)assigning elastic Ip to the network interface

 resource "aws_eip" "dev_eip" {
    network_interface     = aws_network_interface.dev_nic.id
    associate_with_private_ip = "10.81.1.33"
 }

 # 9) creating instance 

 resource "aws_instance" "dev"{
     ami = "ami-0df8c184d5f6ae949"
    instance_type = "t2.micro"
    key_name = "aws"
    user_data = "${file("user_data.sh")}"

    network_interface {
    network_interface_id = aws_network_interface.dev_nic.id
    device_index         = 0
    }

    tags = {
      Name = " Dev"
    }
 }

 output "dev_pub_ip" {
    value = aws_eip.dev_eip.public_ip
 }

 output "dev_pub_ip2" {
    value = aws_instance.dev.public_ip
 }

 
