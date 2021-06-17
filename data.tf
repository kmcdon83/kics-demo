data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_availability_zones" "available" {}

data "aws_ssm_parameter" "aurora_database_username" {
  name = "/HSBC/ACCESS_CONTROL_DB_USERNAME"
}

data "aws_ssm_parameter" "aurora_database_password" {
  name = "/HSBC/ACCESS_CONTROL_DB_PASSWORD"
}

data "aws_route53_zone" "primary" {
  name = "${var.primary_domain}."
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

data "aws_rds_cluster" "clusterName" {
  cluster_identifier = module.db.this_rds_cluster_id
}

data "template_file" "aws_cf_sns_stack1" {
  template = file("${path.module}/templates/cf_aws_sns_email_stack.json.tpl")
  vars = {
    sns_topic_name        = local.sns_topic_name_all_services
    sns_display_name      = upper(local.sns_topic_name_all_services)
    sns_subscription_list = join(",", formatlist("{\"Endpoint\": \"%s\",\"Protocol\": \"%s\"}", var.sns_subscription_email_address_list, "email"))
  }
}

data "template_file" "aws_cf_sns_stack2" {
  template = file("${path.module}/templates/cf_aws_sns_email_stack.json.tpl")
  vars = {
    sns_topic_name        = local.sns_topic_name_cloudtrail
    sns_display_name      = upper(local.sns_topic_name_cloudtrail)
    sns_subscription_list = join(",", formatlist("{\"Endpoint\": \"%s\",\"Protocol\": \"%s\"}", var.sns_subscription_email_address_list_cloudtrail, "email"))
  }
}

data "template_file" "aws_cf_sns_stack3" {
  template = file("${path.module}/templates/cf_aws_sns_email_budget.json.tpl")
  vars = {
    region                = data.aws_region.current.name
    account_id            = data.aws_caller_identity.current.account_id
    sns_topic_name        = local.sns_topic_name_budget
    sns_display_name      = upper(local.sns_topic_name_budget)
    sns_subscription_list = join(",", formatlist("{\"Endpoint\": \"%s\",\"Protocol\": \"%s\"}", var.sns_subscription_email_address_list_budget, "email"))
  }
}