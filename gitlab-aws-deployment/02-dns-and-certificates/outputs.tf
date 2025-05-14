
output "certificate_arn" {
  value = aws_acm_certificate.gitlab_cert.arn
}
