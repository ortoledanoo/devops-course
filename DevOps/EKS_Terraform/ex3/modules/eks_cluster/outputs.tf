# Print all outputs for debugging
output "eks_all_outputs" {
  description = "All outputs from the EKS module"
  value       = module.eks
}

# Node Group outputs
output "eks_managed_node_groups" {
  description = "Details of all Managed Node Groups"
  value       = module.eks.eks_managed_node_groups
}

output "eks_cluster_name" {
  description = "EKS Cluster Name"
  value       = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  description = "EKS Cluster Endpoint"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_arn" {
  description = "EKS Cluster ARN"
  value       = module.eks.cluster_arn
}