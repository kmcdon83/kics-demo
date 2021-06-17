provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  version                = "~> 1.9"
}

module "eks" {
  source                    = "terraform-aws-modules/eks/aws"
  version                   = "12.1.0"
  manage_aws_auth           = false
  cluster_name              = local.cluster_name
  subnets                   = module.vpc.private_subnets
  tags                      = merge(
                                map("Name", local.cluster_name),
                                local.common_tags
                              )
  vpc_id                    = module.vpc.vpc_id
  cluster_version           = var.kubernetes_version
  cluster_enabled_log_types = ["api","audit","authenticator","controllerManager","scheduler"]

  worker_groups = [
  {
    name                          = "worker-group-1"
    instance_type                 = "m4.large"
    key_name                      = var.ssh_keypair_name
    asg_desired_capacity          = 1
    asg_max_size                  = 5
    asg_min_size                  = 1
    #additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
    #iam_instance_profile_name     = aws_iam_instance_profile.node_instance_profile.name
    autoscaling_enabled           = true
  },
  {
    name                          = "worker-group-2"
    instance_type                 = "m4.large"
    key_name                      = var.ssh_keypair_name
    asg_desired_capacity          = 1
    asg_max_size                  = 5
    asg_min_size                  = 1
    #additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
    #iam_instance_profile_name     = aws_iam_instance_profile.node_instance_profile.name
    autoscaling_enabled           = true
  }
]
}
