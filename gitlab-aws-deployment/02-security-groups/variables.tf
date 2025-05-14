
variable "vpc_id" {
  description = "The VPC ID where security groups will be created"
  type        = string
}

variable "allowed_ssh_cidrs" {
  description = "CIDR blocks allowed to SSH to GitLab"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
