
output "gitlab_sg_id" {
  value = aws_security_group.gitlab_sg.id
}

output "aurora_sg_id" {
  value = aws_security_group.aurora_sg.id
}

output "redis_sg_id" {
  value = aws_security_group.redis_sg.id
}
