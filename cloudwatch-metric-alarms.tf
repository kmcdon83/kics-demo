resource "aws_cloudwatch_metric_alarm" "S3BucketActivity" {
  alarm_name          = "CloudTrailS3BucketActivity"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "S3BucketActivityEventCount"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic2.outputs["TopicARN"]]
  alarm_description   = "Alarms when an API call is made to S3 to put or delete a Bucket, Bucket Policy or Bucket ACL."
}

resource "aws_cloudwatch_metric_alarm" "CloudTrailSecurityGroupChanges" {
  alarm_name          = "CloudTrailSecurityGroupChanges"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "SecurityGroupEventCount"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic2.outputs["TopicARN"]]
  alarm_description   = "Alarms when an API call is made to create, update or delete a Security Group."
}

resource "aws_cloudwatch_metric_alarm" "CloudTrailNetworkAclChanges" {
  alarm_name          = "CloudTrailNetworkAclChanges"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "NetworkAclEventCount"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic2.outputs["TopicARN"]]
  alarm_description   = "Alarms when an API call is made to create, update or delete a Network ACL."
}

resource "aws_cloudwatch_metric_alarm" "CloudTrailGatewayChanges" {
  alarm_name          = "CloudTrailGatewayChanges"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "GatewayEventCount"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic2.outputs["TopicARN"]]
  alarm_description   = "Alarms when an API call is made to create, update or delete a Customer or Internet Gateway."
}

resource "aws_cloudwatch_metric_alarm" "CloudTrailVpcChanges" {
  alarm_name          = "CloudTrailVpcChanges"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "VpcEventCount"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic2.outputs["TopicARN"]]
  alarm_description   = "Alarms when an API call is made to create, update or delete a VPC, VPC peering connection or VPC connection to classic."
}

resource "aws_cloudwatch_metric_alarm" "CloudTrailEC2InstanceChanges" {
  alarm_name          = "CloudTrailEC2InstanceChanges"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "EC2InstanceEventCount"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic2.outputs["TopicARN"]]
  alarm_description   = "Alarms when an API call is made to create, terminate, start, stop or reboot an EC2 instance."
}

resource "aws_cloudwatch_metric_alarm" "CloudTrailEC2LargeInstanceChanges" {
  alarm_name          = "CloudTrailEC2LargeInstanceChanges"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "EC2LargeInstanceEventCount"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic2.outputs["TopicARN"]]
  alarm_description   = "Alarms when an API call is made to create, terminate, start, stop or reboot a 4x or 8x-large EC2 instance."
}

resource "aws_cloudwatch_metric_alarm" "CloudTrailChanges" {
  alarm_name          = "CloudTrailChanges"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CloudTrailEventCount"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic2.outputs["TopicARN"]]
  alarm_description   = "Alarms when an API call is made to create, update or delete a .cloudtrail. trail, or to start or stop logging to a trail."
}

resource "aws_cloudwatch_metric_alarm" "CloudTrailConsoleSignInFailures" {
  alarm_name          = "CloudTrailConsoleSignInFailures"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "ConsoleSignInFailureCount"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "3"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic2.outputs["TopicARN"]]
  alarm_description   = "Alarms when an unauthenticated API call is made to sign into the console."
}

resource "aws_cloudwatch_metric_alarm" "CloudTrailAuthorizationFailures" {
  alarm_name          = "CloudTrailAuthorizationFailures"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "AuthorizationFailureCount"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic2.outputs["TopicARN"]]
  alarm_description   = "Alarms when an unauthorized API call is made."
}

resource "aws_cloudwatch_metric_alarm" "CloudTrailIAMPolicyChanges" {
  alarm_name          = "CloudTrailIAMPolicyChanges"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "IAMPolicyEventCount"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic2.outputs["TopicARN"]]
  alarm_description   = "Alarms when an API call is made to change an IAM policy."
}

resource "aws_cloudwatch_metric_alarm" "rds_cpu_utilization_too_high_average" {
  for_each            = data.aws_rds_cluster.clusterName.cluster_members
  alarm_name          = "RDS-CPUUtilization-Percentage-${each.value}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "3"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = "600"
  statistic           = "Average"
  threshold           = local.thresholds["CPUUtilizationThreshold"]
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  ok_actions          = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  alarm_description   = "Alarms when average database CPU utilization is too high."
  tags                = merge(
                          map("Name", "RDS-CPUUtilization-Percentage-${each.value}"),
                          local.common_tags
                        ) 
  dimensions = {
    DBInstanceIdentifier = each.value
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_freeable_memory_too_low" {
  alarm_name          = "RDS-DatabaseFreeableMemoryTooLow"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "3"
  metric_name         = "FreeableMemory"
  namespace           = "AWS/RDS"
  period              = "60"
  statistic           = "Average"
  threshold           = local.thresholds["FreeableMemoryThreshold"]
  alarm_description   = "Average database freeable memory is too low, performance may suffer"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  ok_actions          = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  tags                = merge(
                          map("Name", "RDS-DatabaseFreeableMemoryTooLow"),
                          local.common_tags
                        )

  dimensions = {
    DBInstanceIdentifier = module.db.this_rds_cluster_id
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_cpu_utilization_too_high_anomaly" {
  for_each            = data.aws_rds_cluster.clusterName.cluster_members
  alarm_name          = "RDS-CPUUtilization-Anomaly-${each.value}"
  comparison_operator = "GreaterThanUpperThreshold"
  evaluation_periods  = "3"
  threshold_metric_id = "e1"
  alarm_description   = "Anomalous database high cpu utilization detected. Something unusual is happening."
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  ok_actions          = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  tags                = merge(
                          map("Name", "RDS-CPUUtilization-Anomaly-${each.value}"),
                          local.common_tags
                        )

  metric_query {
    id          = "e1"
    expression  = "ANOMALY_DETECTION_BAND(m1, 10)"
    label       = "CPUUtilization (Expected)"
    return_data = "true"
  }

  metric_query {
    id          = "m1"
    return_data = "true"
    metric {
      metric_name = "CPUUtilization"
      namespace   = "AWS/RDS"
      period      = "300"
      stat        = "Average"

      dimensions = {
        DBInstanceIdentifier = each.value
      }
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_queries_anomaly" {
  for_each            = data.aws_rds_cluster.clusterName.cluster_members
  alarm_name          = "RDS-Queries-Anomaly-${each.value}"
  comparison_operator = "GreaterThanUpperThreshold"
  evaluation_periods  = "3"
  threshold_metric_id = "e1"
  alarm_description   = "Anomalous database high cpu utilization detected. Something unusual is happening."
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  ok_actions          = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  tags                = merge(
                          map("Name", "RDS-Queries-Anomaly-${each.value}"),
                          local.common_tags
                        )

  metric_query {
    id          = "e1"
    expression  = "ANOMALY_DETECTION_BAND(m1, 5)"
    label       = "Queries (Expected)"
    return_data = "true"
  }

  metric_query {
    id          = "m1"
    return_data = "true"
    metric {
      metric_name = "Queries"
      namespace   = "AWS/RDS"
      period      = "300"
      stat        = "Average"

      dimensions = {
        DBInstanceIdentifier = each.value
      }
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_connection_count_anomalous" {
  for_each            = data.aws_rds_cluster.clusterName.cluster_members
  alarm_name          = "RDS-DatabaseConnections-${each.value}"
  comparison_operator = "GreaterThanUpperThreshold"
  evaluation_periods  = "3"
  threshold_metric_id = "e1"
  alarm_description   = "Anomalous database connection count detected. Something unusual is happening."
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  ok_actions          = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  tags                = merge(
                          map("Name", "RDS-DatabaseConnections-${each.value}"),
                          local.common_tags
                        )

  metric_query {
    id          = "e1"
    expression  = "ANOMALY_DETECTION_BAND(m1, 5)"
    label       = "DatabaseConnections (Expected)"
    return_data = "true"
  }

  metric_query {
    id          = "m1"
    return_data = "true"
    metric {
      metric_name = "DatabaseConnections"
      namespace   = "AWS/RDS"
      period      = "300"
      stat        = "Average"

      dimensions = {
        DBInstanceIdentifier = each.value
      }
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_volume_read_iops" {
  alarm_name          = "RDS-VolumeReadIOPs"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "3"
  threshold           = "600000"
  metric_name         = "VolumeReadIOPs"
  namespace           = "AWS/RDS"
  period              = "1200"
  statistic           = "Average"
  alarm_description   = "Volume read IOPS is too high for ${module.db.this_rds_cluster_id}."
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  ok_actions          = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  tags                = merge(
                          map("Name", "RDS-VolumeReadIOPs"),
                          local.common_tags
                        )
  dimensions = {
        DBInstanceIdentifier = module.db.this_rds_cluster_id
      }
}

resource "aws_cloudwatch_metric_alarm" "rds_volume_write_iops" {
  alarm_name          = "RDS-VolumeWriteIOPs"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "3"
  threshold           = "600000"
  metric_name         = "VolumeWriteIOPs"
  namespace           = "AWS/RDS"
  period              = "1200"
  statistic           = "Average"
  alarm_description   = "Volume read IOPS is too high for ${module.db.this_rds_cluster_id}."
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  ok_actions          = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  tags                = merge(
                          map("Name", "RDS-VolumeWriteIOPs"),
                          local.common_tags
                        )
  dimensions = {
        DBInstanceIdentifier = module.db.this_rds_cluster_id
      }
}

resource "aws_cloudwatch_metric_alarm" "rds_deadlocks" {
  for_each             = data.aws_rds_cluster.clusterName.cluster_members
  alarm_name           = "RDS-Deadlocks-${each.value}"
  comparison_operator  = "GreaterThanThreshold"
  evaluation_periods   = "1"
  metric_name          = "Deadlocks"
  namespace            = "AWS/RDS"
  period               = "300"
  statistic            = "Sum"
  threshold            = "0"
  alarm_description    = "Alarms when there are deadlocks in RDS"
  alarm_actions        = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  ok_actions           = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  tags                 = merge(
                            map("Name", "RDS-Deadlocks-${each.value}"),
                            local.common_tags
                          ) 
  dimensions = {
    DBInstanceIdentifier = each.value
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_login_failures" {
  for_each             = data.aws_rds_cluster.clusterName.cluster_members
  alarm_name           = "RDS-LoginFailures-${each.value}"
  comparison_operator  = "GreaterThanThreshold"
  evaluation_periods   = "1"
  metric_name          = "LoginFailures"
  namespace            = "AWS/RDS"
  period               = "300"
  statistic            = "Sum"
  threshold            = "0"
  alarm_description    = "Alarms when there are login failures in RDS"
  alarm_actions        = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  ok_actions           = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  tags                 = merge(
                            map("Name", "RDS-LoginFailures-${each.value}"),
                            local.common_tags
                          ) 
  dimensions = {
    DBInstanceIdentifier = each.value
  }
}

# resource "aws_cloudwatch_metric_alarm" "ec2_cpu_utilization" {
#   count                = length(module.eks.workers_asg_names)
#   alarm_name           = "EC2-CPUUtilization-${module.eks.workers_asg_names[count.index]}"
#   comparison_operator  = "GreaterThanOrEqualToThreshold"
#   evaluation_periods   = "2"
#   metric_name          = "CPUUtilization"
#   namespace            = "AWS/EC2"
#   period               = "120"
#   statistic            = "Average"
#   threshold            = local.thresholds["CPUUtilizationThreshold"]
#   alarm_description    = "Alarms when ec2 CPU utilization is too high"
#   alarm_actions        = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
#   ok_actions           = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
#   tags                 = merge( map("Name", "EC2-CPUUtilization-${module.eks.workers_asg_names[count.index]}"), local.common_tags) 
#   dimensions = {
#     AutoScalingGroupName = module.eks.workers_asg_names[count.index]
#   }
# }

# resource "aws_cloudwatch_metric_alarm" "ec2_status_check_failed_system" {
#   count                = length(module.eks.workers_asg_names)
#   alarm_name           = "EC2-StatusCheckFailed_System-${module.eks.workers_asg_names[count.index]}"
#   comparison_operator  = "GreaterThanThreshold"
#   evaluation_periods   = "1"
#   metric_name          = "StatusCheckFailed_System"
#   namespace            = "AWS/EC2"
#   period               = "60"
#   statistic            = "Maximum"
#   threshold            = "0"
#   alarm_description    = "The AWS systems on which your instances run are not ok. AWS involvement to repair may be required."
#   alarm_actions        = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
#   ok_actions           = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
#   tags                 = merge(
#                             map("Name", "EC2-StatusCheckFailed_System-${module.eks.workers_asg_names[count.index]}"),
#                             local.common_tags
#                           ) 
#   dimensions = {
#     AutoScalingGroupName = module.eks.workers_asg_names[count.index]
#   }
# }

# resource "aws_cloudwatch_metric_alarm" "ec2_status_check_failed_instance" {
#   count                = length(module.eks.workers_asg_names)
#   alarm_name           = "EC2-StatusCheckFailed_Instance-${module.eks.workers_asg_names[count.index]}"
#   comparison_operator  = "GreaterThanThreshold"
#   evaluation_periods   = "1"
#   metric_name          = "StatusCheckFailed_Instance"
#   namespace            = "AWS/EC2"
#   period               = "60"
#   statistic            = "Maximum"
#   threshold            = "0"
#   alarm_description    = "Problems detected on the software and network configuration of your instance. You may need to reboot your instance or change its configuration."
#   alarm_actions        = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
#   ok_actions           = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
#   tags                 = merge(
#                             map("Name", "EC2-StatusCheckFailed_Instance-${module.eks.workers_asg_names[count.index]}"),
#                             local.common_tags
#                           ) 
#   dimensions = {
#     AutoScalingGroupName = module.eks.workers_asg_names[count.index]
#   }
# }

# Elasticsearch alarms - defined by aws recommendations - https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/cloudwatch-alarms.html
resource "aws_cloudwatch_metric_alarm" "kibana_healthy_nodes" {
  alarm_name          = "ES-KibanaHealthyNodes"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "KibanaHealthyNodes"
  namespace           = "AWS/ES"
  period              = "300"
  statistic           = "Minimum"
  threshold           = "1"
  alarm_description   = "Alarms when Kibana is inaccessible. In most cases, the health of Kibana mirrors the health of the cluster."
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  ok_actions          = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  tags                = local.common_tags 
}

resource "aws_cloudwatch_metric_alarm" "es_index_writes_blocked" {
  alarm_name          = "ES-KibanaHealthyNodes"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "ClusterIndexWritesBlocked"
  namespace           = "AWS/ES"
  period              = "300"
  statistic           = "Maximum"
  threshold           = "1"
  alarm_description   = "ElasticSearch cluster is blocking write requests. Some common factors include the following: FreeStorageSpace is too low, JVMMemoryPressure is too high, or CPUUtilization is too high. To alleviate this issue, consider adding more disk space or scaling your cluster."
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  ok_actions          = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  tags                = local.common_tags 
}

resource "aws_cloudwatch_metric_alarm" "es_cluster_status_red" {
  alarm_name          = "ES-ClusterStatus-Red"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "ClusterStatus.red"
  namespace           = "AWS/ES"
  period              = "60"
  statistic           = "Maximum"
  threshold           = "1"
  alarm_description   = "Elasticsearch status is red. At least one primary shard and its replicas are not allocated to a node."
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  ok_actions          = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  tags                = local.common_tags 
}

resource "aws_cloudwatch_metric_alarm" "es_cluster_status_yellow" {
  alarm_name          = "ES-ClusterStatus-Yellow"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "ClusterStatus.yellow"
  namespace           = "AWS/ES"
  period              = "60"
  statistic           = "Maximum"
  threshold           = "1"
  alarm_description   = "Elasticsearch status is yellow. At least one replica shard is not allocated to a node."
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  ok_actions          = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  tags                = local.common_tags 
}

resource "aws_cloudwatch_metric_alarm" "es_free_storage_space" {
  alarm_name          = "ES-FreeStorageSpace"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "FreeStorageSpace"
  namespace           = "AWS/ES"
  period              = "60"
  statistic           = "Average"
  threshold           = "25"
  alarm_description   = "A node in your elasticsearch cluster is down to 25% of free storage space."
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  ok_actions          = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  tags                = local.common_tags 

  dimensions = {
    DomainName = "${var.elasticsearch_namespace}-${var.environment}-${var.product_name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "es_cpu_utilization" {
  alarm_name          = "ES-CPUUtilization"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "3"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ES"
  period              = "900"
  statistic           = "Maximum"
  threshold           = "80"
  alarm_description   = "Elaticsearch cpu utilization is over 80%. Consider using larger instance types or adding instances."
  treat_missing_data  = "notBreaching"
  alarm_actions       = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  ok_actions          = [aws_cloudformation_stack.tf_sns_topic1.outputs["TopicARN"]]
  tags                = local.common_tags 

  dimensions = {
    DomainName = "${var.elasticsearch_namespace}-${var.environment}-${var.product_name}"
  }
}