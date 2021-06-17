locals {
  common_tags = {
      Environment = "${var.environment}"
      Terraform   = "true"
  }
}

locals {
  vpc_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }
  internal_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb" = "1",
  }
  external_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb" = "1"
  }
}

locals {
  cluster_name = "eks-${var.product_name}-${var.environment}"
  sns_topic_name_all_services = "${var.environment}-all-services-notifications-topic"
  sns_topic_name_cloudtrail = "${var.environment}-account-activity-notifications-topic"
  sns_topic_name_budget = "${var.environment}-budget-notifications-topic"
}

locals {
  thresholds = {
    CPUUtilizationThreshold   = "${min(max(var.cpu_utilization_threshold, 0), 100)}"
    FreeableMemoryThreshold   = "${max(var.freeable_memory_threshold, 0)}"
  }
}