
output "dev_pub_ip" {
    value = aws_eip.dev_eip.public_ip
 }

 output "dev_pub_ip2" {
    value = aws_instance.dev.public_ip
 }