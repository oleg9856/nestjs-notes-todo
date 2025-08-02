# Data sources for the project

# Provides available availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

# Provides account ID for ECR and other resources
data "aws_caller_identity" "current" {}
