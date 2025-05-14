
# 08 - Post-Install GitLab Configuration

This step uses the GitLab API to automate basic setup tasks after GitLab is up and running.

---

## 🚀 What It Does

- Waits for GitLab to respond to API requests
- Creates a group and a sample project
- Can be extended for runner registration, user setup, etc.

---

## 🧩 Requirements

- GitLab must be installed and accessible
- You must have a **personal access token** with API scope for the root user

---

## 🔧 Usage

```bash
cd 08-post-install-config
export ROOT_TOKEN="your-root-token"
export GITLAB_URL="https://gitlab.ftso.gr"
bash bootstrap.sh
```

---

## 🛠️ Extendable Ideas

- Register a GitLab runner
- Create CI templates or seed a `.gitlab-ci.yml`
- Add protected branches or project variables


---

## ✅ Validation Checklist

After you complete all steps, validate the deployment with the following:

### 1. Check GitLab Web UI
- Open your browser to `https://gitlab.ftso.gr`
- Verify login page loads and SSL is valid
- Login using your root credentials

### 2. API Check (version)
```bash
curl --header "PRIVATE-TOKEN: <your-token>" https://gitlab.ftso.gr/api/v4/version
```
You should see:
```json
{ "version": "X.Y.Z", ... }
```

### 3. Project Exists
Check if the project created by `bootstrap.sh` exists:
```bash
curl --header "PRIVATE-TOKEN: <your-token>" https://gitlab.ftso.gr/api/v4/projects
```

### 4. Check S3 Uploads
Go to:
- Settings → CI/CD → Artifacts
- Upload files or run a CI job and ensure S3 is being used

### 5. Database & Redis
SSH into your EC2 GitLab instance and run:
```bash
gitlab-rake gitlab:check
gitlab-rake gitlab:env:info
```
Check for any errors with DB/Redis/S3 connectivity.

---

## 🧪 Optional: Runner Registration

If you want to register a GitLab Runner:

```bash
gitlab-runner register   --url https://gitlab.ftso.gr   --registration-token <your-token>   --executor shell   --description "ftso-runner"
```

---

## ✅ Success Criteria

- GitLab UI loads with HTTPS
- Login works
- Project and group are created
- No errors in `gitlab:check`
- Files upload to S3 successfully

