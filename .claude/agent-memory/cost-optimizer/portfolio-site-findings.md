---
name: portfolio-cost-findings
description: Cost optimization analysis for personal static portfolio site (S3+CloudFront)
metadata:
  type: project
---

## Portfolio Site AWS Cost Patterns

**Project Characteristics:**
- Static HTML/CSS portfolio (no JavaScript, no build artifacts)
- Low-traffic personal website
- Deployed via S3 + CloudFront
- Single account, solo developer
- Default region: ap-south-1 (potentially suboptimal for audience)

## Key Cost Issues Identified

### 1. CloudFront PriceClass_200 (High Impact)
- Current: PriceClass_200 includes NA, Europe, Asia, Middle East, Africa
- Issue: 30-40% more expensive than PriceClass_100
- For personal portfolio with likely concentrated audience, overkill
- **Action:** Change to PriceClass_100 or PriceClass_All based on actual traffic patterns

### 2. Region ap-south-1 Origin (Medium Impact)
- Current: S3 bucket in ap-south-1
- Issue: Data transfer from ap-south-1 to CloudFront edges in other regions costs extra
- us-east-1 is cheapest region (no inter-region data transfer costs to US CloudFront edges)
- **Action:** Consider us-east-1 as default region if audience is primarily US/Europe

### 3. Terraform State Management (Not an Issue)
- Currently using local state (no S3 backend)
- DynamoDB for locking is commented out
- **Decision:** Correct for solo project - avoid $0.25/day DynamoDB cost
- Should enable S3 backend only when team collaboration needed

### 4. What NOT to Add (Cost Saving Decisions)
- CloudFront access logging: $0.10 per 10K requests + S3 storage
- WAF: $5/month + $0.60/million requests
- S3 Intelligent-Tiering: Unnecessary for static content
- S3 versioning: Not needed for static portfolio
- For low-traffic personal site: skip these

### 5. Well-Optimized Aspects
- CachingOptimized cache policy (good for static content)
- CloudFront compression enabled
- No unnecessary logging
- Correct OAC + public access blocking
