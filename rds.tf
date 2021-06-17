module "db" {
  source                          = "terraform-aws-modules/rds-aurora/aws"
  version                         = "~> 2.0"
  name                            = "aurora-db-mysql-${var.environment}"
  engine                          = "aurora-mysql"
  engine_version                  = "5.7.12"

  vpc_id                          = module.vpc.vpc_id
  subnets                         = module.vpc.public_subnets

  replica_scale_enabled           = true
  replica_scale_min               = 2
  replica_scale_max               = 15
  replica_scale_cpu               = "50"
  allowed_security_groups         = [module.eks.worker_security_group_id]
  allowed_cidr_blocks             = ["111.111.111.111/32"]
  instance_type                   = "db.r5.large"
  storage_encrypted               = true
  apply_immediately               = true
  monitoring_interval             = 10
  deletion_protection             = false

  username                        = data.aws_ssm_parameter.aurora_database_username.value
  password                        = data.aws_ssm_parameter.aurora_database_password.value

  db_parameter_group_name         = aws_db_parameter_group.aurora_db_57_parameter_group.id
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.aurora_group_UTF8.id

  enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]

  tags  = merge(
    map("Name", "aurora-db-mysql-${var.environment}"),
    local.common_tags
  )
}

resource "aws_db_parameter_group" "aurora_db_57_parameter_group" {
  name        = "test-aurora-db-57-parameter-group"
  family      = "aurora-mysql5.7"
  description = "test-aurora-db-57-parameter-group"
}

resource "aws_rds_cluster_parameter_group" "aurora_group_UTF8" {
  name        = "aurora-group"
  family      = "aurora-mysql5.7"
  description = "support UTF8"

  parameter {
    name  = "character_set_client"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_connection"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_database"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_results"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_server"
    value = "utf8mb4"
  }

  parameter {
    name  = "collation_connection"
    value = "utf8mb4_unicode_ci"
  }

  parameter {
    name  = "collation_server"
    value = "utf8mb4_unicode_ci"
  }
}