# create database subnet group
resource "aws_db_subnet_group" "database_subnet_group" {
  name        = "${var.project_name}-${var.environment}-database-subnets"
  subnet_ids  = [aws_subnet.private_data_subnet1.id, aws_subnet.private_data_subnet2.id ]
  description = "subnets for database instance"

  tags = {
    Name = "${var.project_name}-${var.environment}-database-subnets"
  }
}

resource "aws_db_instance" "database_instance" {
  identifier              = "obligatoriosparisdb"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro" 
  allocated_storage       = 20
  storage_type            = "gp2"
  username                = var.db_username
  password                = var.db_password
  db_name                 = "obligatoriosparisdb"
  port                    = 3306
  skip_final_snapshot     = true
  publicly_accessible     = false
  multi_az                = true
  db_subnet_group_name    = aws_db_subnet_group.database_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.database_security_group.id]
  deletion_protection     = false

  tags = {
    Name = "${var.project_name}-${var.environment}-rds"
  }
}