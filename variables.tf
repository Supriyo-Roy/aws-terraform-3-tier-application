variable "region" {
  type    = string
  default = "us-east-1"
}

variable "az" {
  type        = list(any)
  description = "avaibility zones of public and private subnets"
  default     = ["us-east-1a", "us-east-1b"]
}
variable "main_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_cidr_blocks" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]

}


variable "private_cidr_blocks" {
  type    = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}



# rds variables
variable "rds_db_admin" {
  type    = string
  default = "admin"
}

variable "rds_db_password" {
  type    = string
  default = "myreallygoodpassword"
}

variable "multi_az" {
  type    = bool
  default = false
}

variable "db_name" {
  type    = string
  default = "mydb"
}

variable "engine_version" {
  type    = string
  default = "5.7.37"
}

variable "allocated_storage" {
  type    = number
  default = 10
}

variable "instance_class" {
  type    = string
  default = "db.t2.micro"
}

variable "db_engine" {
  type    = string
  default = "mysql"
}
