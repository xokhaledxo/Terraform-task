resource "aws_db_instance" "rds_instance" {
  allocated_storage    = 20
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  engine_version       = "15"
  //name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = aws_db_parameter_group.rds_parameter_group.name
  vpc_security_group_ids = [var.security_group_id]
  storage_encrypted    = false
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
}

resource "aws_db_parameter_group" "rds_parameter_group" {
  name   = "custom-postgres9-6"
  family = "postgres15"

  parameter {
    name  = "max_connections"
    value = "100"
    apply_method = "pending-reboot"
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.db_name}-subnet-group"
  subnet_ids = [var.subnet_id[0], var.subnet_id[1]]

  tags = {
    Name = "${var.db_name}-subnet-group"
  }
}
