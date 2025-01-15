variable "region" {
  description = "AWS region"
  type        = string
  default     = "il-central-1"
}

variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
  default     = "Or-Cluster"
}

variable "cluster_version" {
  description = "EKS Cluster Version"
  type        = string
  default     = "1.31"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)
}