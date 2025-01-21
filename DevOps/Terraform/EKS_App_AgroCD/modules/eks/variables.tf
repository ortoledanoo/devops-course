variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "cluster_version" {
  description = "EKS cluster version"
  type        = string
}

variable "instance_type" {
  description = "Imstance Type Foe Node Group"
  type        = string
}

