resource "aws_cloudtrail" "cloud_trail_all" {
  depends_on                    = [aws_s3_bucket.cloud_trail]
  name                          = "${var.product_name}-${var.environment}-trail-all"
  s3_bucket_name                = aws_s3_bucket.cloud_trail.id
  s3_key_prefix                 = "prefix"
  cloud_watch_logs_role_arn     = aws_iam_role.cloudtrail_logs_role.arn
  cloud_watch_logs_group_arn    = aws_cloudwatch_log_group.cloudtrail_all_logs.arn
  include_global_service_events = true
  enable_logging                = true
  is_multi_region_trail         = false
  enable_log_file_validation    = false

  tags  = merge(
    map("Name", "${var.product_name}-${var.environment}-trail-all"),
    local.common_tags
  )
}