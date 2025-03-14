resource "aws_security_group" "rds_sg" {
  name_prefix = "rds-sg-"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "rds_postgres" {
  identifier            = var.db_instance_id
  engine                = var.db_engine
  engine_version        = var.db_engine_version
  instance_class        = var.db_instance_class
  allocated_storage     = var.db_storage
  max_allocated_storage = var.db_max_storage
  storage_type          = "gp2"

  username              = var.db_username
  password              = var.db_password
  db_name               = "fast_food"

  parameter_group_name  = var.db_parameter_group_name

  publicly_accessible   = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  storage_encrypted     = true  

  performance_insights_enabled          = true
  performance_insights_retention_period = 7

  skip_final_snapshot  = true
}