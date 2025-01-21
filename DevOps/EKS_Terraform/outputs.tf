output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}

output "vpc_id" {
  value = module.vpc.vpc_id_output
}

output "private_subnet_ids" {
  value = module.vpc.private_subnets_output
}

output "public_subnet_ids" {
  value = module.vpc.public_subnets_output
}
