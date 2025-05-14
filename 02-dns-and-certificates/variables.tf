
variable "domain_name" {
  description = "The domain name for GitLab"
  type        = string
  default     = "gitlab.ftso.gr"
}

variable "hosted_zone_id" {
  description = "The Route 53 Hosted Zone ID"
  type        = string
}
