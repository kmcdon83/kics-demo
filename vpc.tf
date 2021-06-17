module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  version              = "2.18.0"
  name                 = "access-control-${var.environment}-vpc"
  cidr                 = var.base_cidr_block

  azs                  = data.aws_availability_zones.available.names
  private_subnets      = var.private_subnets
  public_subnets       = var.public_subnets

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway   = true
  single_nat_gateway   = true

  vpc_tags = merge(
    map("Name", "access-control-${var.environment}-vpc"),
    local.common_tags,
    local.vpc_tags
  )

  private_subnet_tags = merge(
    map("Name", "access-control-${var.environment}-private-subnet"),
    local.common_tags,
    local.internal_subnet_tags
  )

  public_subnet_tags = merge(
    map("Name", "access-control-${var.environment}-public-subnet"),
    local.common_tags,
    local.external_subnet_tags
  )

  igw_tags = merge(
    map("Name", "access-control-${var.environment}-internet-gateway"),
    local.common_tags,
  )
}

resource "aws_flow_log" "vpc_flow_logs" {
  depends_on      = [module.vpc]
  iam_role_arn    = aws_iam_role.vpc_flow_logs.arn
  log_destination = aws_cloudwatch_log_group.vpc_flow_logs.arn
  traffic_type    = "ALL"
  vpc_id          = module.vpc.vpc_id
}