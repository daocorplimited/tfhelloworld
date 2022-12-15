resource "aws_s3_bucket" "b" {
  bucket = "test-bucket"

  tags = {
    Name        = "Test bucket"
    Environment = "Dev"
  }
}

data "aws_route53_zone" "reportsdomain" {
  name         = local.domain_zone
  private_zone = false
}

resource "aws_route53_record" "reports" {
  zone_id = data.aws_route53_zone.reportsdomain.zone_id
  name    = "reports"
  type    = "CNAME"
  ttl     = "5"

  weighted_routing_policy {
    weight = 10
  }

  set_identifier = "reports"
  records        = [var.reports_elb_record]
}