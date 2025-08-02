# Terraform variables file
# This file contains default values for the Terraform configuration

aws_region        = "us-east-1"
environment       = "production"
app_name          = "nestjs-notes-todo"
app_port          = 3000
desired_count     = 1
cpu               = 256
memory            = 512
health_check_path = "/api"

# Note: database_uri should be set via environment variable or CI/CD secrets
database_uri = "mongodb+srv://admin:admin@cluster0.lxlnffx.mongodb.net/notes-todo"
