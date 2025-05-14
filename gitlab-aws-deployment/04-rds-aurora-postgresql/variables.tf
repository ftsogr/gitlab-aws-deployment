
variable "cluster_identifier" {
  type        = string
  default     = "gitlab-aurora"
}

variable "master_username" {
  type        = string
  default     = "gitlab"
}

variable "master_password" {
  type        = string
  default     = "REPLACE_ME"
}

variable "database_name" {
  type        = string
  default     = "gitlabhq_production"
}

variable "instance_class" {
  type        = string
  default     = "db.t4g.medium"
}

variable "instance_count" {
  type        = number
  default     = 1
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}
