#########################################
#####                               #####
# # #   Print VPC Output to stdout  # # #
#####                               #####
#########################################

output "vpc_nat_public_ips" {
  description = "List of public IPs of the NAT Gateway"
  value       = module.vpc.nat_public_ips
}

#########################################
#####                               #####
# # #   Print RDS Output to stdout  # # #
#####                               #####
#########################################

output "this_rds_cluster_id" {
  description = "The ID of the cluster"
  value       = module.db.this_rds_cluster_id
}
output "this_rds_cluster_endpoint" {
  description = "The cluster endpoint"
  value       = module.db.this_rds_cluster_endpoint
}
output "this_rds_cluster_instance_endpoints" {
  description = "A list of all cluster instance endpoints"
  value       = module.db.this_rds_cluster_instance_endpoints
}
output "this_security_group_id" {
  description = "The security group ID of the cluster"
  value       = module.db.this_security_group_id
}
output "this_rds_cluster_port" {
    description = "The port"
    value = "module.db.this_rds_cluster_port"
}

#########################################
#####                               #####
# # #   Print EKS Output to stdout  # # #
#####                               #####
#########################################

output "cluster_endpoint" {
  value       = module.eks.cluster_endpoint
  description = "The endpoint for your EKS Kubernetes API."
}

output "cluster_id" {
  value       = module.eks.cluster_id
  description = "The name/id of your EKS Kubernetes cluster."
}

output "cluster_ca_certificate" {
  value       = module.eks.cluster_certificate_authority_data
  description = "Nested attribute containing certificate-authority-data for your cluster. This is the base64 encoded certificate data required to communicate with your cluster."
}

output "kubeconfig" {
  value       = module.eks.kubeconfig
  description = "kubectl config file contents for this EKS cluster."
}

output "kubeconfig_filename" {
  value       = module.eks.kubeconfig_filename
  description = "The filename of the generated kubectl config."
}

output "config_map_aws_auth" {
  value       = module.eks.config_map_aws_auth
  description = "A kubernetes configuration to authenticate to this EKS cluster."
}

#########################################
#####                               #####
# # #   Print var Output to stdout  # # #
#####                               #####
#########################################

output "product_name" {
  value       = var.product_name
  description = "Product name"
}

output "environment" {
  value       = var.environment
  description = "The current environment"
}

output "hosted_zone_id" {
  value       = data.aws_route53_zone.primary.zone_id
  description = "Route53 hosted zone id"
}

output "primary_domain" {
  value       = var.primary_domain
  description = "Route53 primary domain" 
}

#########################################
#####                               #####
# # #   Print S3 Output to stdout  # # #
#####                               #####
#########################################

output "s3_access_logs_bucket_name" {
  value = aws_s3_bucket.access_logs.id
}
