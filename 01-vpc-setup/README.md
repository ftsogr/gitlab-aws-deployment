# 01 - VPC Setup

This module provisions the foundational AWS Virtual Private Cloud (VPC) and associated public subnets.

## Components

- One VPC with DNS support
- Two public subnets across availability zones

## Usage

```bash
cd 01-vpc-setup
tofu init
tofu apply
```

## Inputs

| Variable              | Description                    | Default                |
|-----------------------|--------------------------------|------------------------|
| region                | AWS region                     | us-west-2              |
| vpc_cidr              | CIDR block for the VPC         | 10.0.0.0/16            |
| availability_zones    | List of AZs                    | [us-west-2a, us-west-2b]|
| public_subnet_cidrs   | CIDRs for public subnets       | [10.0.1.0/24, 10.0.2.0/24]|

## Outputs

- `vpc_id`
- `public_subnet_ids`


---

## 🔧 Replace Before You Run

Make sure to review `variables.tf` in this directory and replace:

- Any placeholder defaults (like CIDRs, passwords, instance types)
- AWS region if not using `us-west-2`
- Your VPC/Subnet IDs if pulling from another module

Use `terraform output` or OpenTofu equivalents to wire modules together.
## Related Projects

To extend this infrastructure with GitLab Runners on AWS Fargate using Kaniko, refer to the [gitlab-runners-aws-fargate-kaniko](https://github.com/ftsogr/gitlab-runners-aws-fargate-kaniko) repository.
