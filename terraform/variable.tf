variable "aws_region" {
  type    = string
  default = "ap-southeast-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "private_subnet_cidr_2" {
  description = "CIDR cho private subnet B"
  type        = string
  default     = "10.0.3.0/24"
}

variable "key_pair_name" {
  type    = string
  default = "perm"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ami_id" {
  type = string
  # Amazon Linux 2
  default = "ami-0c2b8ca1dad447f8a"
}

variable "db_username" {
  type    = string
  default = "admin"
}

variable "db_password" {
  type      = string
  default   = "ChangeMe123!"
  sensitive = true
}

variable "db_name" {
  type    = string
  default = "counterdb"
}
