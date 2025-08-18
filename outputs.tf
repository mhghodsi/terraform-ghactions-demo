output "demo_bucket_name" {
  description = "The name of the demo bucket"
  value       = module.demo_bucket.bucket_name
}

output "custom_bucket_name" {
  description = "The name of the custom bucket"
  value       = module.custom_bucket.bucket_name
}

output "cloudfront_distribution_ids" {
  description = "IDs of CloudFront distributions"
  value       = var.enable_cloudfront ? module.cloudfront[0].distribution_ids : []
}