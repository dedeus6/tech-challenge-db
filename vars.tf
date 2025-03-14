variable "db_instance_id" {
  default     = "fast-food-db"
}

variable "db_engine" {
  default     = "postgres"
}

variable "db_engine_version" {
  default     = "17.2"
}

variable "db_instance_class" {
  default     = "db.t4g.micro"
}

variable "db_storage" {
  default     = 20
}

variable "db_max_storage" {
  default     = 1000
}

variable "db_username" {
  default     = "postgres"
}

variable "db_password" {
  type        = string
  sensitive   = true
}

variable "db_parameter_group_name" {
  default     = "default.postgres17"
}