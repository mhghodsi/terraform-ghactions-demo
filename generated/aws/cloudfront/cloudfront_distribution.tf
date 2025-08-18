resource "aws_cloudfront_distribution" "tfer--E2I9EC2K5CXXJ3" {
  default_cache_behavior {
    allowed_methods = ["GET", "HEAD"]
    cache_policy_id = "${aws_cloudfront_cache_policy.tfer--4135ea2d-6df8-44a3-9df3-4b5a84be39ad.id}"
    cached_methods  = ["GET", "HEAD"]
    compress        = "false"
    default_ttl     = "0"

    grpc_config {
      enabled = "false"
    }

    max_ttl                  = "0"
    min_ttl                  = "0"
    origin_request_policy_id = "0972d665-4832-4894-b155-554e1c2268ac"
    smooth_streaming         = "false"
    target_origin_id         = "v2.ghsustain.com"
    viewer_protocol_policy   = "redirect-to-https"
  }

  enabled         = "true"
  http_version    = "http2and3"
  is_ipv6_enabled = "true"

  origin {
    connection_attempts = "3"
    connection_timeout  = "10"

    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_keepalive_timeout = "5"
      origin_protocol_policy   = "https-only"
      origin_read_timeout      = "30"
      origin_ssl_protocols     = ["TLSv1.2"]
    }

    domain_name = "v2.ghsustain.com"
    origin_id   = "v2.ghsustain.com"
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  retain_on_delete = "false"
  staging          = "false"

  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:335804577025:certificate/0f792fff-f2b1-4565-9fbb-fbe5d9c34ce4"
    cloudfront_default_certificate = "false"
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }
}

resource "aws_cloudfront_distribution" "tfer--E38DTQL7ZOV6T1" {
  default_cache_behavior {
    allowed_methods = ["GET", "HEAD"]
    cache_policy_id = "${aws_cloudfront_cache_policy.tfer--4135ea2d-6df8-44a3-9df3-4b5a84be39ad.id}"
    cached_methods  = ["GET", "HEAD"]
    compress        = "false"
    default_ttl     = "0"

    grpc_config {
      enabled = "false"
    }

    max_ttl                  = "0"
    min_ttl                  = "0"
    origin_request_policy_id = "0972d665-4832-4894-b155-554e1c2268ac"
    smooth_streaming         = "false"
    target_origin_id         = "v2.ghsustain.com"
    viewer_protocol_policy   = "redirect-to-https"
  }

  enabled         = "true"
  http_version    = "http2and3"
  is_ipv6_enabled = "true"

  origin {
    connection_attempts = "3"
    connection_timeout  = "10"

    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_keepalive_timeout = "5"
      origin_protocol_policy   = "https-only"
      origin_read_timeout      = "30"
      origin_ssl_protocols     = ["TLSv1.2"]
    }

    domain_name = "v2.ghsustain.com"
    origin_id   = "v2.ghsustain.com"
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  retain_on_delete = "false"
  staging          = "false"

  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:335804577025:certificate/0f792fff-f2b1-4565-9fbb-fbe5d9c34ce4"
    cloudfront_default_certificate = "false"
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }
}
