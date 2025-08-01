output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = aws_ecr_repository.nestjs_app.repository_url
}

output "load_balancer_url" {
  description = "Load balancer URL"
  value       = "https://${var.domain_name}"
}

output "load_balancer_dns" {
  description = "Load balancer DNS name"
  value       = aws_lb.main.dns_name
}

output "ecs_cluster_name" {
  description = "ECS cluster name"
  value       = aws_ecs_cluster.main.name
}

output "ecs_service_name" {
  description = "ECS service name"
  value       = aws_ecs_service.main.name
}

output "route53_zone_id" {
  description = "Route 53 hosted zone ID"
  value       = aws_route53_zone.main.zone_id
}

output "route53_name_servers" {
  description = "Route 53 name servers"
  value       = aws_route53_zone.main.name_servers
}

output "certificate_arn" {
  description = "ACM Certificate ARN"
  value       = aws_acm_certificate.main.arn
}
