
# 03 - S3 Object Storage

This module provisions the S3 buckets GitLab uses for object storage.

## Usage

```bash
cd 03-s3-object-storage
tofu init
tofu apply
```

## Variables

- `bucket_names`: A list of S3 buckets to create

## Outputs

- `bucket_names`: List of created S3 bucket names


---

## 🔧 Replace Before You Run

Make sure to review `variables.tf` in this directory and replace:

- Any placeholder defaults (like CIDRs, passwords, instance types)
- AWS region if not using `us-west-2`
- Your VPC/Subnet IDs if pulling from another module

Use `terraform output` or OpenTofu equivalents to wire modules together.
