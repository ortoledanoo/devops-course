variable "region" {
  description = "AWS region"
  type        = string
  default     = "il-central-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}

variable "instance_type" {
  description = "Imstance Type Foe Node Group"
  type        = string
  default     = "t3.medium"
}

variable "cluster_version" {
  description = "Imstance Type Foe Node Group"
  type        = string
  default     = "1.29"
}