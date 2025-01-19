variable "region" {
  description = "AWS region"
  type        = string
  default     = "il-central-1"
}

variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
  default     = "my-eks-cluster"
}

variable "cluster_version" {
  description = "EKS Cluster Version"
  type        = string
  default     = "1.31"
}

variable "instance_type" {
  description = "Instance Type of worker nodes"
  type        = string
  default     = "t3.small"
}

variable "ami_type" {
  description = "AMI Type of Worker Nodes"
  type        = string
  default     = "AL2_x86_64"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)
}