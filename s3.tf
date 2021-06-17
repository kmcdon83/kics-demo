resource "aws_s3_bucket" "access_logs" {
    bucket   = "${var.product_name}-${var.environment}-access-logs"
    acl      = "private"
    region   = data.aws_region.current.name
    tags  = merge(
        map("Name", "${var.product_name}-${var.environment}-access-logs"),
        local.common_tags
    )
}

resource "aws_s3_bucket_policy" "access_logs" {
    depends_on = [aws_s3_bucket.access_logs]
    bucket     = aws_s3_bucket.access_logs.id

    policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Principal": {
            "AWS": "arn:aws:iam::${lookup(var.elastic_load_balancing_account_id, data.aws_region.current.name)}:root"
        },
        "Action": "s3:*",
        "Resource": "arn:aws:s3:::${aws_s3_bucket.access_logs.id}/${var.product_name}/*"
        }
    ]
}
POLICY
}

resource "aws_s3_bucket" "cloud_trail" {
  bucket        = "${var.product_name}-${var.environment}-cloud-trail"
  force_destroy = true

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::${var.product_name}-${var.environment}-cloud-trail"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.product_name}-${var.environment}-cloud-trail/prefix/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY
}

