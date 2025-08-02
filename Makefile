# Makefile for NestJS Notes Todo

.PHONY: help install build test deploy destroy clean

# Default target
help:
	@echo "Available commands:"
	@echo "  install    - Install dependencies"
	@echo "  build      - Build the application"
	@echo "  test       - Run tests"
	@echo "  dev        - Start development server"
	@echo "  deploy     - Deploy to AWS"
	@echo "  destroy    - Destroy AWS infrastructure"
	@echo "  clean      - Clean build artifacts"

# Install dependencies
install:
	npm install

# Build application
build:
	npm run build

# Run tests
test:
	npm run test

# Start development server
dev:
	npm run start:dev

# Terraform operations
tf-init:
	cd terraform && terraform init

tf-plan:
	cd terraform && terraform plan

tf-apply:
	cd terraform && terraform apply

tf-destroy:
	cd terraform && terraform destroy

# Deploy application
deploy: build
	chmod +x deploy.sh
	./deploy.sh

# Clean build artifacts
clean:
	rm -rf dist/
	rm -rf node_modules/

# Docker operations
docker-build:
	docker build -t nestjs-notes-todo .

docker-run:
	docker run -p 3000:3000 --env-file .env nestjs-notes-todo

# Local development with Docker
docker-dev:
	docker-compose up -d

docker-logs:
	docker-compose logs -f nestjs-app

docker-stop:
	docker-compose down

create-repo-aws:
	aws ecr create-repository --repository-name nestjs-notes-todo --region us-east-1
