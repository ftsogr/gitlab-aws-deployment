
resource "aws_s3_bucket" "gitlab" {
  for_each = toset(var.bucket_names)

  bucket = each.value

  tags = {
    Name        = each.value
    Environment = "gitlab"
  }
}
