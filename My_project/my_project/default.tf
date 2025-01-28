provider "aws" {
    region = "us-east-1" 
}

module "vpc_module" {
    source = "./main_file"
    vpc_cidr_block = 11.7.0.0/16
    sn_cidr_block = 11.7.1.0/24
    private_ips = ["11.7.1.33"]
    eip_association_with_private_ip = "11.7.1.33"
    ami = mi-0df8c184d5f6ae949
    instance_type = "t2.micro"
    key_name = "dev"
    Name = "dev"
}