
# 02 - Security Groups

This module provisions security groups for:
- GitLab EC2 instance (SSH, HTTP, HTTPS)
- Aurora PostgreSQL access (port 5432 from GitLab)
- Redis access (port 6379 from GitLab)

## Usage

```bash
cd 02-security-groups
tofu init
tofu apply
```

## Inputs

| Variable         | Description                        | Default        |
|------------------|------------------------------------|----------------|
| `vpc_id`         | VPC to attach security groups      | *required*     |
| `allowed_ssh_cidrs` | CIDRs allowed SSH access       | `["0.0.0.0/0"]`|

## Outputs

- `gitlab_sg_id`
- `aurora_sg_id`
- `redis_sg_id`


---

## 🔧 Replace Before You Run

Make sure to review `variables.tf` in this directory and replace:

- Any placeholder defaults (like CIDRs, passwords, instance types)
- AWS region if not using `us-west-2`
- Your VPC/Subnet IDs if pulling from another module

Use `terraform output` or OpenTofu equivalents to wire modules together.
