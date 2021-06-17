resource "aws_budgets_budget" "cost" {
  name              = "monthly-budget"
  budget_type       = "COST"
  limit_amount      = "2000.0"
  limit_unit        = "USD"
  time_period_start = "2020-05-01_00:00"
  time_unit         = "MONTHLY"
  cost_types { # used default values
    # A boolean value whether to include credits in the cost budget
    include_credit             = true
    # A boolean value whether a budget includes discounts
    include_discount           = true
    # A boolean value whether to include other subscription costs in the cost budget
    include_other_subscription = true
    # A boolean value whether to include recurring costs in the cost budget
    include_recurring          = true
    # A boolean value whether to include refunds in the cost budget
    include_refund             = true
    # A boolean value whether to include subscriptions in the cost budget
    include_subscription       = true
    # A boolean value whether to include support costs in the cost budget
    include_support            = true
    # A boolean value whether to include tax in the cost budget
    include_tax                = true
    # A boolean value whether to include upfront costs in the cost budget
    include_upfront            = true
    # A boolean value whether a budget uses the amortized rate
    use_amortized              = false
    # A boolean value whether to use blended costs in the cost budget
    use_blended                = false
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 80
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_sns_topic_arns  = [aws_cloudformation_stack.tf_sns_topic3.outputs["TopicARN"]]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_sns_topic_arns  = [aws_cloudformation_stack.tf_sns_topic3.outputs["TopicARN"]]
  }
}