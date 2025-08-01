#!/bin/bash

# Automated deployment script for NestJS Notes Todo
# This script builds, pushes Docker image and updates ECS service

set -e

echo "🚀 Starting automated deployment..."

# Get ECR repository URL
ECR_URL=$(terraform -chdir=terraform output -raw ecr_repository_url)
ECS_CLUSTER=$(terraform -chdir=terraform output -raw ecs_cluster_name)
ECS_SERVICE=$(terraform -chdir=terraform output -raw ecs_service_name)
AWS_REGION=$(terraform -chdir=terraform output -raw aws_region || echo "us-east-1")

echo "📦 ECR Repository: $ECR_URL"
echo "🔧 ECS Cluster: $ECS_CLUSTER"
echo "⚙️  ECS Service: $ECS_SERVICE"

# Login to ECR
echo "🔐 Logging into ECR..."
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_URL

# Build Docker image
echo "🏗️  Building Docker image..."
docker build -t nestjs-notes-todo .

# Tag image for ECR
echo "🏷️  Tagging image..."
docker tag nestjs-notes-todo:latest $ECR_URL:latest

# Push to ECR
echo "📤 Pushing image to ECR..."
docker push $ECR_URL:latest

# Update ECS service
echo "🔄 Updating ECS service..."
aws ecs update-service \
    --cluster $ECS_CLUSTER \
    --service $ECS_SERVICE \
    --force-new-deployment \
    --region $AWS_REGION

echo "✅ Deployment completed successfully!"
echo "🌐 Your application will be available at: $(terraform -chdir=terraform output -raw load_balancer_url)"

# Wait for deployment to stabilize
echo "⏳ Waiting for deployment to stabilize..."
aws ecs wait services-stable \
    --cluster $ECS_CLUSTER \
    --services $ECS_SERVICE \
    --region $AWS_REGION

echo "🎉 Deployment is now stable and ready to serve traffic!"
