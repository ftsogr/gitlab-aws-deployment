
output "instance_id" {
  value = aws_instance.gitlab.id
}

output "public_ip" {
  value = aws_instance.gitlab.public_ip
}
