variable "db_username" {
  description = "The username for the RDS instance"
  type        = string
}

variable "db_password" {
  description = "The password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID for the RDS instance"
  type        = list(string)
}

variable "security_group_id" {
  description = "The security group ID for the RDS instance"
  type        = string
}

variable "parameter_group_name" {
  description = "The name of the DB parameter group"
  type        = string
  default     = "default.postgres9.6"
}

variable "parameter_group_family" {
  description = "The family of the DB parameter group"
  type        = string
  default     = "postgres9.6"
}
