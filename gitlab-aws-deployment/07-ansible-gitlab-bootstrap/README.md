
# 07 - GitLab Setup with Ansible

This step installs and configures **GitLab Community Edition** on an EC2 instance using **Ansible**.

---

## 📦 What This Does

- Installs GitLab CE using the official Omnibus package
- Configures:
  - PostgreSQL connection (Aurora)
  - Redis connection (ElastiCache)
  - S3 object storage (artifacts, uploads, etc.)
  - HTTPS with NGINX and custom SSL certs
- Uses a Jinja2 template (`gitlab.rb.j2`) rendered with values from `group_vars/gitlab.yml`

---

## 📁 File Structure

| File/Folder                     | Description                          |
|---------------------------------|--------------------------------------|
| `playbook.yml`                  | Main Ansible playbook                |
| `group_vars/gitlab.yml`         | Variable file (S3, DB, Redis, SSL)   |
| `templates/gitlab.rb.j2`        | Jinja2 template for GitLab config    |
| `roles/gitlab/tasks/main.yml`   | Task list for GitLab installation    |

---

## 🔧 Prerequisites

- Ensure the EC2 instance is reachable over SSH
- Update your **inventory** file or use `--inventory` inline
- Your SSH key should match `private_key_path` in the EC2 module

---

## ▶️ How to Run

From this directory:

```bash
ansible-playbook -i inventory playbook.yml
```

Example `inventory`:

```ini
[gitlab]
your-ec2-public-ip ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/your-key.pem
```

---

## 🔁 Customization

Modify values in `group_vars/gitlab.yml`:

- `external_url`: Your GitLab domain
- `s3_*`: Bucket names and credentials
- `db_*`: Aurora connection info
- `redis_*`: Redis cluster host/port
- `ssl_cert_path`: Path to cert files on instance

---

## 🛠️ Notes

- Google SSO is disabled in this config (can be added later)
- GitLab is configured to use Let's Encrypt certs or your own
- Ensure ports `22`, `80`, and `443` are open via Security Groups

---



---

## 🌐 Custom Domain Note

This configuration uses `gitlab.ftso.gr` as an example domain.

🔁 **Before deploying**, replace it with your actual GitLab domain:
- In `07-ansible-gitlab-bootstrap/group_vars/gitlab.yml`
- In `09-dns-and-certificates/variables.tf`
- In any security groups, ACM certs, or DNS records

Example:
```yaml
external_url: "https://your.gitlab.domain"
```

Failing to update the domain will result in broken HTTPS or unreachable services.
