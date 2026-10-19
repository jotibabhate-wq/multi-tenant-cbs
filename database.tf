# Aurora is opt-in because it incurs charges. Set create_database=true after review.
resource "aws_db_subnet_group" "main" {
  count      = var.create_database ? 1 : 0
  name       = "${var.project_name}-db-subnets"
  subnet_ids = aws_subnet.private[*].id
  tags       = { Environment = var.environment }
}

resource "aws_rds_cluster" "control" {
  count                       = var.create_database ? 1 : 0
  cluster_identifier          = "${var.project_name}-control"
  engine                      = "aurora-mysql"
  database_name               = "cbscontrol"
  master_username             = "cbsadmin"
  manage_master_user_password = true
  db_subnet_group_name        = aws_db_subnet_group.main[0].name
  vpc_security_group_ids      = [aws_security_group.database.id]
  storage_encrypted            = true
  skip_final_snapshot          = false
  final_snapshot_identifier    = "${var.project_name}-final-snapshot"
  backup_retention_period      = 1
  deletion_protection          = true
  tags                        = { Environment = var.environment }
}

resource "aws_rds_cluster_instance" "control" {
  count              = var.create_database ? 1 : 0
  identifier         = "${var.project_name}-control-1"
  cluster_identifier = aws_rds_cluster.control[0].id
  instance_class     = var.db_instance_class
  engine             = aws_rds_cluster.control[0].engine
}
