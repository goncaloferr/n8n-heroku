# n8n – Heroku Deploy (Docker)

This repository exists to deploy our dedicated **n8n** server to **Heroku** using Docker.  
Heroku auto-deploys on any push to `main`.

---

## 🚀 Deploy with `latest` (default flow)

We track the Docker image tag `latest`. To trigger a new deploy, just bump the README and push:

```bash
# edit README.md and add a line like:
# "bump: 2025-08-18"

git add README.md
git commit -m "chore: bump version 2025-08-18"
git push origin main
```
Heroku detects the change and redeploys with the current latest image.

## 📌 Pin to a Specific n8n Version

1. Find the tag you want at: n8n Docker Hub Tags
2. Update the first line of the Dockerfile to use that tag, e.g.:

```dockerfile
# BEFORE (tracking latest)
FROM n8nio/n8n:latest

# AFTER (pin to a specific version)
FROM n8nio/n8n:1.52.1
```
3. Commit and push to main:

```bash
git commit -am "feat: pin n8n to 1.52.1"
git push origin main
```
4. Heroku will redeploy using that exact version.


## Version History

- Bump n8n version 10/02/2025
- Bump n8n version 15/08/2025
