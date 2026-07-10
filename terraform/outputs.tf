output "cloudfront_distribution_id" {
  value       = aws_cloudfront_distribution.s3_distribution.id
  description = "The CloudFront distribution ID"
}

output "cloudfront_domain_name" {
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
  description = "The CloudFront distribution domain name"
}

output "s3_bucket_name" {
  value       = aws_s3_bucket.website.id
  description = "The name of the S3 bucket"
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.website.arn
  description = "The ARN of the S3 bucket"
}
