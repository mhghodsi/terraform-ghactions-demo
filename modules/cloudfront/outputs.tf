output "distribution_ids" {
  description = "IDs of the CloudFront distributions"
  value = [
    aws_cloudfront_distribution.distribution1.id,
    aws_cloudfront_distribution.distribution2.id
  ]
}