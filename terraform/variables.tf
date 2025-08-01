# Variables for Terraform configuration

variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "nestjs-notes-todo"
}

variable "app_port" {
  description = "Application port"
  type        = number
  default     = 3000
}

variable "image_tag" {
  description = "Docker image tag"
  type        = string
  default     = "latest"
}

variable "database_uri" {
  description = "MongoDB connection string"
  type        = string
  sensitive   = true
}

variable "desired_count" {
  description = "Desired number of ECS tasks"
  type        = number
  default     = 1
}

variable "cpu" {
  description = "CPU units for the task"
  type        = number
  default     = 256
}

variable "memory" {
  description = "Memory for the task"
  type        = number
  default     = 512
}

variable "health_check_path" {
  description = "Health check path"
  type        = string
  default     = "/api/v1/health"
}
