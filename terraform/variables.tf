variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "domain_name" {
  description = "Domain name for the application"
  type        = string
  default     = "your-domain.com"
}

variable "database_uri" {
  description = "MongoDB connection string"
  type        = string
  sensitive   = true
}
