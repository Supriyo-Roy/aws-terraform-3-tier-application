variable "db_username" {
  type = string
  default = "roy"
}
variable "db_password" {
  type = string
  default = "myreallygoodpassword"
}

variable "multi_az" {
  type = bool
  default = "false"
}

variable "db_name" {
  type = string
  default = "mydb"
}

variable "engine_version" {
  type = string
  default = "5.7.37"
}

variable "allocated_storage" {
  type = number
  default = 10
}

variable "vpc_id" {
  type = string
}

variable "subnets" {
  type = list(any)
}

variable "from_sgs" {
  type = list(any)
}

variable "instance_class" {
  type = string
}

variable "engine" {
  type = string
}