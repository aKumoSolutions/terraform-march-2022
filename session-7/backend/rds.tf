resource "aws_db_instance" "wordpress" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_name              = "wordpress"      #Name of my database, not a RDS name
  username             = "admin"
  password             = random_password.db_password.result
  identifier           = "${var.env}-rds-instance"     // format(%s-rds-instance, var.env)           #Name of your RDS instance, not a database
  publicly_accessible  = var.env == "dev" ? true : false 
  skip_final_snapshot  = var.env == "dev" ? true : false
  final_snapshot_identifier = var.env == "dev" ? null : "${var.env}-db-snapshot"
}

// dev
// skip_final_snapshot = true
// final_snapshot_identifier = empty(null)

// qa
// skip_final_snapshot = false
// final_snapshot_identifier = qa-db-snapshot

// prod
// skip_final_snapshot = false
// final_snapshot_identifier = prod-db-snapshot
