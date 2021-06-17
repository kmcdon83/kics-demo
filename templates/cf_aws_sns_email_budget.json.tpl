{
 "AWSTemplateFormatVersion": "2010-09-09",
  "Resources": {
    "SNSTopic": {
      "Type": "AWS::SNS::Topic",
      "Properties": {
        "TopicName": "${sns_topic_name}",
        "DisplayName": "${sns_display_name}",
        "Subscription": [
          ${sns_subscription_list}
        ]
      }
    },
    "SNSTopicPolicy":{
      "Type" : "AWS::SNS::TopicPolicy",
      "Properties" : {
          "PolicyDocument" :  {
            "Version": "2008-10-17",
              "Id": "__default_policy_ID",
              "Statement": [
                {
                  "Sid": "AWSBudgetsSNSPublishingPermissions",
                  "Effect": "Allow",
                  "Principal": {
                    "Service": "budgets.amazonaws.com"
                  },
                  "Action": "SNS:Publish",
                  "Resource": "arn:aws:sns:${region}:${account_id}:${sns_topic_name}"
                },
                {
                  "Sid": "__default_statement_ID",
                  "Effect": "Allow",
                  "Principal": {
                    "AWS": "*"
                  },
                  "Action": [
                    "SNS:Publish",
                    "SNS:RemovePermission",
                    "SNS:SetTopicAttributes",
                    "SNS:DeleteTopic",
                    "SNS:ListSubscriptionsByTopic",
                    "SNS:GetTopicAttributes",
                    "SNS:Receive",
                    "SNS:AddPermission",
                    "SNS:Subscribe"
                  ],
                  "Resource": "arn:aws:sns:${region}:${account_id}:${sns_topic_name}",
                  "Condition": {
                    "StringEquals": {
                      "AWS:SourceOwner": "${account_id}"
                    }
                  }
                }
              ]
            },
          "Topics" : [ { "Ref" : "SNSTopic" } ]
        }
    }
  },
  "Outputs": {
    "TopicARN" : {
      "Description" : "ARN of newly created SNS Topic",
      "Value" : { "Ref" : "SNSTopic" }
    }
  }
}