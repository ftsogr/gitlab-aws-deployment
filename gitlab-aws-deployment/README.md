
## 🌐 IMPORTANT: Set Your GitLab Domain First

This project uses `gitlab.ftso.gr` as an example.

🛠️ Before running any step, replace all references to this domain with your actual GitLab domain:

- `07-ansible-gitlab-bootstrap/group_vars/gitlab.yml`
- `02-dns-and-certificates/variables.tf`
- Any SSL certs or Route 53 records

Example replacement:

```yaml
external_url: "https://your.gitlab.domain"
```

Failing to update your domain will result in SSL and DNS issues.




# GitLab Deployment on AWS (Using OpenTofu + Ansible)

This project guides you through deploying a **production-ready GitLab CE setup** on AWS using **OpenTofu** (Terraform fork) and **Ansible**. It follows a modular, transparent, and infrastructure-as-code-first approach inspired by [kubernetes-the-hard-way](https://github.com/kelseyhightower/kubernetes-the-hard-way).

---

## 🔧 What This Deploys

- **Networking (VPC)**: Custom VPC with public subnets
- **EC2 Instance**: Ubuntu VM running GitLab CE (Omnibus package)
- **S3 Buckets**: Object storage for GitLab artifacts, LFS, uploads, etc.
- **Aurora PostgreSQL**: Highly available database for GitLab
- **ElastiCache Redis**: Managed caching backend
- **Security Groups**: Rules for SSH, HTTP/S, DB, Redis access
- **GitLab Configuration**: Installed and configured with Ansible

---

## 📁 Folder-by-Folder Usage

Each folder represents a deployment step:

| Step | Directory                  | Description                                |
|------|----------------------------|--------------------------------------------|
| 00   | `00-prerequisites.md`      | Tooling & AWS setup requirements            |
| 01   | `01-vpc-setup/`            | Creates the base VPC and subnets           |
| 02   | `02-security-groups/`      | Defines access rules for EC2, DB, Redis    |
| 03   | `03-s3-object-storage/`    | Creates S3 buckets for GitLab object store |
| 04   | `04-rds-aurora-postgresql/`| Sets up Aurora DB cluster                  |
| 05   | `05-elasticache-redis/`    | Creates Redis cluster                      |
| 06   | `06-ec2-gitlab/`           | Launches GitLab EC2 instance               |
| 07   | `07-ansible-gitlab-bootstrap/` | Installs and configures GitLab CE    |
| 08   | `08-post-install-config/`  | (Optional) Runner registration, automation |

Each module contains:
- `main.tf`, `variables.tf`, `outputs.tf`
- A local `README.md` with step-by-step usage

---

## 🧩 Requirements

- AWS account and IAM permissions
- [OpenTofu](https://opentofu.org/) installed
- [Ansible](https://www.ansible.com/) installed
- SSH keypair accessible for EC2 provisioning

---

## 🚀 How to Use

1. Clone this repo and `cd` into each folder step-by-step
2. Run:
   ```bash
   tofu init
   tofu apply
   ```
   in each module
3. After provisioning infrastructure, run the Ansible playbook:
   ```bash
   cd 07-ansible-gitlab-bootstrap
   ansible-playbook -i inventory playbook.yml
   ```

---

## 🛡️ Security Notes

- No secrets are hardcoded — use variables or secret managers.
- You can extend this repo with Vault, ACM, or SSM Parameter Store for secure secret handling.

---

## 🧠 Philosophy

We believe in learning by building. This repo favors clarity over abstraction, and is designed to be **educational, modular, and production-adaptable**.


---

## 📝 What You Need to Customize

You should review and update the following **variables and files** before running:

### 🔐 Secrets and Keys

| File/Var                         | Replace With                                  |
|----------------------------------|-----------------------------------------------|
| `group_vars/gitlab.yml`          | S3 keys, DB password, Redis host, domain name |
| `ec2-gitlab/private_key_path`    | Path to your SSH private key                  |
| `ec2-gitlab/key_name`            | Name of your existing AWS key pair            |
| `ssl_cert_path`, `ssl_key_path`  | Paths to actual SSL certs on your instance    |

---

### 🌍 Networking and Region

Check and replace:

- AWS region: `us-west-2` (can be changed in `variables.tf`)
- Subnet CIDRs, AZs, VPC CIDR in `01-vpc-setup/variables.tf`

---

### 💡 Security Group Notes

Default SSH access is open to `0.0.0.0/0` — change this in `02-security-groups/variables.tf` for production:

```hcl
allowed_ssh_cidrs = ["your.office.ip/32"]
```

---

### 🛑 Don’t Forget

- Replace all default passwords and keys before deploying.
- Never commit secrets or real AWS credentials.
- Use AWS IAM roles or SSM Parameter Store for better security in production.

---


---

## 📜 Module Overview

Each step is independent and customizable via variables.

### 00 - Prerequisites

Ensure you have:
- AWS credentials configured (`aws configure`)
- OpenTofu installed
- Ansible installed
- EC2 key pair created and accessible

### 01 - VPC Setup

Creates the foundational network infrastructure (VPC + public subnets).

```bash
cd 01-vpc-setup
tofu init
tofu apply
```

### 02 - Security Groups

Defines access rules (SSH, HTTP/HTTPS, etc.) for GitLab and supporting services.

### 03 - S3 Object Storage

Creates S3 buckets used by GitLab CE for:
- Artifacts
- Uploads
- LFS
- Terraform state, etc.

### 04 - RDS Aurora PostgreSQL

Provision a serverless Aurora cluster to be used by GitLab.

### 05 - ElastiCache Redis

Creates a Redis cluster used by GitLab for caching and sessions.

### 06 - EC2 GitLab

Creates an EC2 instance (Ubuntu) where GitLab CE will be installed.

### 07 - GitLab Bootstrap with Ansible

Configure and install GitLab CE with Ansible.

```bash
cd 07-ansible-gitlab-bootstrap
ansible-playbook -i inventory playbook.yml
```

### 08 - Post-Install Config

Optional GitLab CLI/API-based automation or runner registration.

---

## Authors

This project is inspired by [kelsey/kubernetes-the-hard-way](https://github.com/kelseyhightower/kubernetes-the-hard-way)
and follows a similar philosophy: **manual, transparent setup with modular automation**.

---

## 👏 Credits

Kudos to the **Logicea DevOps Team**  
🌐 Visit [logicea.com](https://logicea.com) for more.

---


---

## 🌐 Custom Domain Note

This configuration uses `gitlab.ftso.gr` as an example domain.

🔁 **Before deploying**, replace it with your actual GitLab domain:
- In `07-ansible-gitlab-bootstrap/group_vars/gitlab.yml`
- In `02-dns-and-certificates/variables.tf`
- In any security groups, ACM certs, or DNS records

Example:
```yaml
external_url: "https://your.gitlab.domain"
```

Failing to update the domain will result in broken HTTPS or unreachable services.
