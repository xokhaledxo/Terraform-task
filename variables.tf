variable "region" {
  description = "The AWS region to deploy the RDS instance"
  type        = string
  default     = "us-east-1"
}

variable "db_username" {
  description = "The username for the RDS instance"
  type        = string
  default     = "kaldb"
}

variable "db_password" {
  description = "The password for the RDS instance"
  type        = string
  sensitive   = true
  default     = "Akal20241"
}

variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "mydb"
}

variable "subnet_id" {
  description = "The subnet ID for the RDS instance"
  type        = list(string)
  default     = ["subnet-082bf561e4e73a481","subnet-03801c8a6ba9cfbc8"]
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "rds_sg"
}
