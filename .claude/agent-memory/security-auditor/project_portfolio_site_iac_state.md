---
name: project-portfolio-site-iac-state
description: Current known gaps in the portfolio-site Terraform config (terraform/) as of the 2026-07-10 audit
metadata:
  type: project
---

As of 2026-07-10, `terraform/` (main.tf, providers.tf, variables.tf, outputs.tf, backend.tf) provisions an S3 + CloudFront static site with OAC correctly configured and public access block enabled. Recurring gaps found in the first full audit:

- No `aws_s3_bucket_server_side_encryption_configuration` (no SSE at rest).
- No `aws_s3_bucket_versioning` (and therefore no MFA delete).
- No `aws_s3_bucket_logging` and no CloudFront `logging_config` block.
- No CloudFront `response_headers_policy` (no CSP / X-Frame-Options / HSTS).
- No `aws_s3_bucket_ownership_controls` (BucketOwnerEnforced) for defense-in-depth against ACLs.
- `backend.tf` remote S3 backend is intentionally commented out with manual setup instructions — state is local by default until someone completes the migration steps in the file.
- `.gitignore` only excludes `.terraform` — it does NOT exclude `*.tfstate`, `*.tfvars`, `crash.log.*`, or `override.tf`, so a local `terraform.tfstate` (created before the remote backend is set up) could be accidentally committed.
- No IAM/OIDC resources exist anywhere in the repo (no GitHub Actions workflow found either at time of audit) — the CI/CD deployment identity and its permissions are not yet defined in Terraform, so least-privilege for the deploy pipeline can't be assessed yet.

**Why:** These are the concrete, repeatable findings surfaced when auditing this specific repo's IaC — useful to check first in future audits to see if they've been remediated yet, rather than rediscovering from scratch.

**How to apply:** On future audits of this repo, check whether these specific gaps have been closed before doing a full re-scan. If IAM/OIDC or a GitHub Actions workflow has been added since, review it against least-privilege and repo/branch-scoped trust policy requirements.
