resource "aws_db_subnet_group" "default" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.private.id]
}

resource "aws_db_instance" "mysql" {
  identifier             = "counter-mysql"
  engine                 = "mysql"
  engine_version         = "8.0" # tuỳ chọn
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  db_name                = var.db_name # <-- sửa ở đây
  username               = var.db_username
  password               = var.db_password
  skip_final_snapshot    = true
  publicly_accessible    = false
  deletion_protection    = false
  vpc_security_group_ids = [aws_security_group.sg_rds.id]
  db_subnet_group_name   = aws_db_subnet_group.default.name

  tags = {
    Name = "counter-rds"
  }
}
