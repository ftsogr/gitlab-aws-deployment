
variable "cluster_id" {
  type        = string
  default     = "gitlab-redis"
}

variable "node_type" {
  type        = string
  default     = "cache.t3.micro"
}

variable "num_cache_nodes" {
  type        = number
  default     = 1
}

variable "redis_port" {
  type        = number
  default     = 6379
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}

variable "subnet_group_name" {
  type    = string
  default = "gitlab-redis-subnet-group"
}
