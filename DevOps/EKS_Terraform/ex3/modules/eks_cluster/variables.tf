variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "my-cluster"
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.31"
}

variable "vpc_id" {
  description = "ID of the VPC to deploy the EKS cluster into"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster worker nodes"
  type        = list(string)
}

variable "control_plane_subnet_ids" {
  description = "List of subnet IDs for the EKS cluster control plane"
  type        = list(string)
}

variable "cluster_endpoint_public_access" {
  description = "Whether to enable public access for the EKS cluster endpoint"
  type        = bool
  default     = true
}

variable "enable_cluster_creator_admin_permissions" {
  description = "Enable admin permissions for the cluster creator"
  type        = bool
  default     = true
}

variable "default_instance_types" {
  description = "Default instance types for managed node groups"
  type        = list(string)
  default     = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"]
}

variable "eks_managed_node_groups" {
  description = "EKS managed node groups configuration"
  type        = map(any)
  default     = {
    example = {
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t3.medium"]
      min_size       = 2
      max_size       = 10
      desired_size   = 2
    }
  }
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {
    Environment = "dev"
    Terraform   = "true"
  }
}