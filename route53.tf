provider "aws" {
  alias  = "Virginia"
  region = "us-east-1"
}

resource "aws_cloudwatch_log_group" "aws_route53_primary" {
  provider = aws.Virginia

  name              = "/aws/route53/${data.aws_route53_zone.primary.name}"
  retention_in_days = 30
}

data "aws_iam_policy_document" "route53-query-logging-policy" {
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["arn:aws:logs:*:*:log-group:/aws/route53/*"]

    principals {
      identifiers = ["route53.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_cloudwatch_log_resource_policy" "route53-query-logging-policy" {
  provider = aws.Virginia

  policy_document = data.aws_iam_policy_document.route53-query-logging-policy.json
  policy_name     = "route53-query-logging-policy"
}

resource "aws_route53_query_log" "primary_domain" {
  depends_on = [aws_cloudwatch_log_resource_policy.route53-query-logging-policy]

  cloudwatch_log_group_arn = aws_cloudwatch_log_group.aws_route53_primary.arn
  zone_id                  = data.aws_route53_zone.primary.zone_id
}