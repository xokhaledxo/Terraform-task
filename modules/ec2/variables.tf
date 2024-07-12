variable "ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID for the EC2 instance"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID for the EC2 instance"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the EC2 instance will be deployed"
  type        = string
}