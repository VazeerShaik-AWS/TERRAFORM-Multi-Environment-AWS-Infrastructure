variable "project_name" {
  description = "Prefix used for resource names and tags"
  type        = string
  default     = "vs"
}

variable "aws_region" {
  description = "AWS region where resources are deployed"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.10.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance type for the web server"
  type        = string
  default     = "t2.micro"
}
