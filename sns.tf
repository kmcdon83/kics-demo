resource "aws_cloudformation_stack" "tf_sns_topic1" {
  name          = "sns-stack-services"
  template_body = data.template_file.aws_cf_sns_stack1.rendered
  tags          = local.common_tags
  on_failure    = "ROLLBACK"
}

resource "aws_cloudformation_stack" "tf_sns_topic2" {
  name          = "sns-stack-cloudtrail"
  template_body = data.template_file.aws_cf_sns_stack2.rendered
  tags          = local.common_tags
  on_failure    = "ROLLBACK"
}

resource "aws_cloudformation_stack" "tf_sns_topic3" {
  name          = "sns-stack-budget"
  template_body = data.template_file.aws_cf_sns_stack3.rendered
  tags          = local.common_tags
  #on_failure    = "ROLLBACK"
}