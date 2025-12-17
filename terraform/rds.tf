# DB Subnet Group
resource "aws_db_subnet_group" "taskflow" {
  name_prefix = "${var.app_name}-"
  subnet_ids  = [aws_subnet.private_1.id, aws_subnet.private_2.id]

  tags = {
    Name = "${var.app_name}-db-subnet"
  }
}

# RDS PostgreSQL Instance
resource "aws_db_instance" "taskflow" {
  identifier           = "${var.app_name}-db"
  engine               = "postgres"
  engine_version       = "15"
  instance_class       = var.rds_instance_class
  allocated_storage    = 20
  storage_type         = "gp3"
  
  db_name  = var.db_name
  username = var.db_username
  password = var.db_password
  
  db_subnet_group_name            = aws_db_subnet_group.taskflow.name
  vpc_security_group_ids          = [aws_security_group.rds.id]
  publicly_accessible             = false
  skip_final_snapshot             = true
  backup_retention_period         = 1
  
  tags = {
    Name = "${var.app_name}-db"
  }
}

output "rds_endpoint" {
  value = aws_db_instance.taskflow.endpoint
}

output "rds_address" {
  value = aws_db_instance.taskflow.address
}
