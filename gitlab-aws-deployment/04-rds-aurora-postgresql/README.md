
# 04 - RDS Aurora PostgreSQL

This module provisions an Aurora PostgreSQL cluster for GitLab.

## Usage

```bash
cd 04-rds-aurora-postgresql
tofu init
tofu apply
```

## Inputs

- `cluster_identifier`: Name of the Aurora cluster
- `master_username`: DB username
- `master_password`: DB password
- `database_name`: Name of the GitLab DB
- `subnet_ids`: List of private subnet IDs
- `security_group_ids`: List of SGs with DB access

## Outputs

- `aurora_endpoint`
- `aurora_reader_endpoint`


---

## 🔧 Replace Before You Run

Make sure to review `variables.tf` in this directory and replace:

- Any placeholder defaults (like CIDRs, passwords, instance types)
- AWS region if not using `us-west-2`
- Your VPC/Subnet IDs if pulling from another module

Use `terraform output` or OpenTofu equivalents to wire modules together.
