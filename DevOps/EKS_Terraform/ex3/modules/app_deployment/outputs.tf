output "service_name" {
  description = "Name of the Kubernetes service"
  value       = kubernetes_service.weather_app.metadata[0].name
}

output "load_balancer_hostname" {
  description = "Hostname of the load balancer"
  value       = try(kubernetes_service.weather_app.status.0.load_balancer.0.ingress.0.hostname, null)
}

output "deployment_name" {
  description = "Name of the Kubernetes deployment"
  value       = kubernetes_deployment.weather_app.metadata[0].name
}