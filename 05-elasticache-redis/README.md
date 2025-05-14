
# 05 - ElastiCache Redis

This module provisions a Redis cluster using AWS ElastiCache.

## Usage

```bash
cd 05-elasticache-redis
tofu init
tofu apply
```

## Inputs

- `cluster_id`: Redis cluster identifier
- `node_type`: Redis instance type
- `num_cache_nodes`: Number of nodes
- `redis_port`: Port to expose (default: 6379)
- `subnet_ids`: Subnet IDs for the cluster
- `security_group_ids`: Security groups with Redis access

## Outputs

- `redis_endpoint`
- `redis_port`


---

## 🔧 Replace Before You Run

Make sure to review `variables.tf` in this directory and replace:

- Any placeholder defaults (like CIDRs, passwords, instance types)
- AWS region if not using `us-west-2`
- Your VPC/Subnet IDs if pulling from another module

Use `terraform output` or OpenTofu equivalents to wire modules together.
