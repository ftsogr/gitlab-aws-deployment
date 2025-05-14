
# 06 - EC2 GitLab

This module provisions an EC2 instance that will host GitLab CE.

## Usage

```bash
cd 06-ec2-gitlab
tofu init
tofu apply
```

## Inputs

- `ami_id`: AMI for Ubuntu 22.04 or compatible
- `instance_type`: EC2 type (e.g. t3.medium)
- `subnet_id`: Subnet ID to deploy to
- `security_group_ids`: SGs to apply
- `key_name`: Name of the EC2 SSH key
- `ssh_user`: SSH login user (default: ubuntu)
- `private_key_path`: Path to private key for remote-exec

## Outputs

- `instance_id`
- `public_ip`


---

## 🔧 Replace Before You Run

Make sure to review `variables.tf` in this directory and replace:

- Any placeholder defaults (like CIDRs, passwords, instance types)
- AWS region if not using `us-west-2`
- Your VPC/Subnet IDs if pulling from another module

Use `terraform output` or OpenTofu equivalents to wire modules together.
