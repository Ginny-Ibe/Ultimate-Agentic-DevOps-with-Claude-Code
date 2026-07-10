---
name: feedback-audit-output-style
description: Security/IaC audits for this repo should be delivered as a direct chat response, not written to report files
metadata:
  type: feedback
---

When asked to audit Terraform (or other IaC) in this repo, treat it as read-only: do not use Write/Edit to create report/findings files, and do not modify the audited .tf files. Findings should be returned directly in the final assistant message, prioritized by severity (CRITICAL/HIGH/MEDIUM/LOW), each with file path + line number, the issue, why it matters, and a concrete fix.

**Why:** The user explicitly requested a read-only audit and asked for a prioritized list in the response itself, not a generated report artifact.

**How to apply:** Default to this style for future "audit"/"review" requests on this repo unless the user explicitly asks for a written report file.
