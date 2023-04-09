variable "aws_pg_db_name" {
  type        = string
  default = "admindb"
}

variable "aws_pg_allocated_storage" {
  type        = number
  default = 20
}

variable "aws_pg_engine" {
    type = string
    default = "postgres"
}

variable "aws_pg_engine_version" {
    type = string
    default = "14.4"
}

variable "aws_pg_instance_class" {
    type = string
    default = "db.t3.micro"
}

variable "aws_pg_username"{
    type = string
    default = "demouser"
}

variable "aws_pg_password" {
  type = string
  default= "Democloud123"
}

# variable "vpc_subnet_id" {
#   description = "It provides subnet ID from VPC"
#   type    = string
# }


variable "subnet_id" {
  type = list(string)
}

