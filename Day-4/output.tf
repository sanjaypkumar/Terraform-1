output "instance_public_ip" {
  value     = aws_instance.test.public_ip
  sensitive = true

}

output "instance_private_ip" {
  value     = aws_instance.test.private_ip
  sensitive = true

}

output "instance_private_dns" {

  value = aws_instance.test.private_dns
}

output "instance_public_dns" {
  value = aws_instance.test.public_dns

}
