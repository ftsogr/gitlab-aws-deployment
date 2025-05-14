
variable "bucket_names" {
  description = "List of S3 bucket names for GitLab object storage"
  type        = list(string)
  default     = ['ftso-gitlab-artifacts', 'ftso-infra-gitlabs3bucket']
}
