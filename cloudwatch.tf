resource "aws_cloudwatch_log_group" "cloudtrail_all_logs" {
  name = "/aws/cloudtrail/cloudtrail-log-group-${var.environment}"

  tags  = merge(
    map("Name", "/aws/cloudtrail/cloudtrail-log-group-${var.environment}"),
    local.common_tags
  )
}

resource "aws_cloudwatch_log_group" "cloudwatch_logs_containers" {
  name = "/aws/eks/${module.eks.cluster_id}/containers"

  tags  = merge(
    map("Name", "/aws/eks/${module.eks.cluster_id}/containers"),
    local.common_tags
  )
}

resource "aws_cloudwatch_log_group" "cloudwatch_logs_systemd" {
  name = "/aws/eks/${module.eks.cluster_id}/systemd"

  tags  = merge(
    map("Name", "/aws/eks/${module.eks.cluster_id}/systemd"),
    local.common_tags
  )
}

resource "aws_cloudwatch_log_group" "vpc_flow_logs" {
  name = "/aws/vpc/vpc-flow-logs-${var.environment}"

  tags  = merge(
    map("Name", "/aws/vpc/vpc-flow-logs-${var.environment}"),
    local.common_tags
  )
}

resource "aws_cloudwatch_log_group" "elk_application_logs" {
  name = "/aws/aes/domains/${var.elasticsearch_namespace}-${var.environment}-${var.product_name}/application-logs"

  tags  = merge(
    map("Name", "/aws/aes/domains/${var.elasticsearch_namespace}-${var.environment}-${var.product_name}/application-logs"),
    local.common_tags
  )
}

resource "aws_cloudwatch_log_resource_policy" "elk_application_logs" {
  policy_name = "AES-${var.elasticsearch_namespace}-${var.environment}-${var.product_name}-Application-logs"
  policy_document = <<CONFIG
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "es.amazonaws.com"
      },
      "Action": [
        "logs:PutLogEvents",
        "logs:PutLogEventsBatch",
        "logs:CreateLogStream"
      ],
      "Resource": "arn:aws:logs:*"
    }
  ]
}
CONFIG
}
