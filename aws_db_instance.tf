
resource "aws_db_instance" "bia" {
  allocated_storage           = 20
  allow_major_version_upgrade = null
  apply_immediately           = null
  auto_minor_version_upgrade  = true
  #availability_zone           = "us-east-1c" // Retirado para trabalhar com VPC customizada
  backup_retention_period     = 1
  backup_window               = "10:13-10:43"
  ca_cert_identifier          = "rds-ca-rsa2048-g1"
  character_set_name          = null
  copy_tags_to_snapshot       = true
  custom_iam_instance_profile = null
  customer_owned_ip_enabled   = false
  db_name                     = null
  #db_subnet_group_name                  = "default-vpc-03ae161aaa45aba73" // Retirar essa linha para desvincular à subnet default - Para o caso de mudança de ambiente
  delete_automated_backups              = true
  deletion_protection                   = false
  domain                                = null
  domain_iam_role_name                  = null
  enabled_cloudwatch_logs_exports       = []
  engine                                = "postgres"
  engine_version                        = jsonencode(16.3)
  final_snapshot_identifier             = null
  iam_database_authentication_enabled   = false
  identifier                            = "bia"
  identifier_prefix                     = null
  instance_class                        = "db.t3.micro"
  iops                                  = 0
  kms_key_id                            = "arn:aws:kms:us-east-1:975050268480:key/993a0845-0200-41e6-8e4a-fa431f22aa29"
  license_model                         = "postgresql-license"
  maintenance_window                    = "thu:08:40-thu:09:10"
  manage_master_user_password           = true
  master_user_secret_kms_key_id         = null
  max_allocated_storage                 = 1000
  monitoring_interval                   = 0
  monitoring_role_arn                   = null
  multi_az                              = false
  nchar_character_set_name              = null
  network_type                          = "IPV4"
  option_group_name                     = "default:postgres-16"
  parameter_group_name                  = "default.postgres16"
  password                              = null # sensitive
  performance_insights_enabled          = false
  performance_insights_kms_key_id       = null
  performance_insights_retention_period = 0
  port                                  = 5432
  publicly_accessible                   = false
  replica_mode                          = null
  replicate_source_db                   = null
  skip_final_snapshot                   = true
  snapshot_identifier                   = null
  storage_encrypted                     = true
  storage_throughput                    = 0
  storage_type                          = "gp2"
  tags                                  = {}
  tags_all                              = {}
  timezone                              = null
  username                              = "postgres"
  vpc_security_group_ids                = [aws_security_group.bia_db.id]

  db_subnet_group_name = aws_db_subnet_group.bia.name
}

resource "aws_db_subnet_group" "bia" {
  name       = "bia-subnet-group"
  subnet_ids = [local.subnet_zona_a, local.subnet_zona_b]

  tags = {
    Name = "bia-subnet-group"
  }
}
