
# 09 - DNS & SSL Certificate with Route 53 + ACM

This module provisions:
- A DNS-validated ACM certificate for GitLab
- Route 53 records to complete domain validation

---

## 🧩 What You Need

- A public hosted zone in Route 53 for `ftso.gr`
- Permissions to create ACM certificates and Route 53 records

---

## 🔧 Configuration

Edit `variables.tf`:

```hcl
domain_name     = "gitlab.ftso.gr"
hosted_zone_id  = "ZXXXXXXXXXXX"  # Replace with your zone ID
```

---

## ▶️ Usage

```bash
cd 02-dns-and-certificates
tofu init
tofu apply
```

Then attach this ACM certificate to:
- Load balancer or NGINX TLS setup (e.g., via AWS ALB or manually)

---

## ✅ Validation

ACM will automatically validate the DNS records within minutes. Check AWS ACM console for certificate status.



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
