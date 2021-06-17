variable "region" {
  type        = string
  description = "region"
  default     = "us-east-1"
}

variable "environment" {
  type        = string
  description = "environment"
  default     = "staging"
}

variable "base_cidr_block" {
  description = "A /16 CIDR range definition that the VPC will use"
  default     = "10.106.0.0/16"
}

variable "product_name" {
  description = "Checkmarx product name"
  default = "access-control"
}

variable "private_subnets" {
  description = "A list of private subnets that the VPC will use"
  type    = list(string)
  default = ["10.106.1.0/24", "10.106.2.0/24", "10.106.3.0/24"]
}

variable "public_subnets" {
  description = "A list of public subnets that the VPC will use"
  type    = list(string)
  default = ["10.106.101.0/24", "10.106.102.0/24", "10.106.103.0/24"]
}

variable "kubernetes_version" {
  type = string
  description = "Desired Kubernetes master version. If you do not specify a value, the latest available version is used"
  default = "1.15"
}

variable "primary_domain" {
  type = string
  description = "Domain name to use"
  default = "demo-domain.com"
}

variable "auth_domain_name" {
  type = string	
  description = "Auth Domain Name"
  default = "*.auth.demo-domain.com"
}

variable "shared_account_id" {	
  type = string	
  description = "AWS shared account"	
  default = "account_id"	
}

variable "ecr_repo_name" {
  type = string
  description = "AWS ECR repository name"
  default = "demo"
}

variable "application_protocol" {
  type = string
  description = "Web protocol (http/https)"
  default = "http"  
}

variable "elasticsearch_instance_type" {
  type        = string
  description = "Elasticsearch cluster instance type"
  default     = "m5.large.elasticsearch"
}

variable "elasticsearch_version" {
  type        = string
  description = "Elasticsearch cluster version"
  default     = "7.4"
}

variable "elasticsearch_namespace" {
  type        = string
  description = "Elasticsearch cluster namespace"
  default     = "elk"
}

variable "kibana_subdomain_name" {
  type        = string
  description = "The name of the subdomain for Kibana in the DNS zone"
  default     = "kibana"
}

variable "office_security_group_id" {
  type        = string
  description = "The id of the office security group"
  default     = "sg-demo-id"
}

variable "ssh_keypair_name" {
  type        = string
  description = "The key pair name used to connect to ec2 instances"
  default     = "demo-key-pair"
}

variable "elastic_load_balancing_account_id" {
  type        = map
  description = "Elastic Load Balancing Account ID"

  default = {
    eu-west-1 = "account_id"
    us-east-1 = "account_id"
  }
}

variable "freeable_memory_threshold" {
  description = "The minimum amount of available random access memory in Byte."
  type        = string
  default     = 64000000
  # 64 Megabyte in Byte
}

variable "cpu_utilization_threshold" {
  description = "The maximum percentage of CPU utilization."
  type        = string
  default     = 80
}

variable "sns_subscription_email_address_list" {
  type        = list(string)
  description = "List of email addresses which will recieve alerts on all services"
  default     = ["demo.com","demo1.com"]
}

variable "sns_subscription_email_address_list_cloudtrail" {
  type        = list(string)
  description = "List of email addresses which will receive alerts on account activity from cloudtrail"
  default     = ["demo.com","demo1.com"]
}

variable "sns_subscription_email_address_list_budget" {
  type        = list(string)
  description = "List of email addresses which will receive budget alerts"
  default     = ["demo.com","demo1.com"]
}





