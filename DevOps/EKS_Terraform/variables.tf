variable "region" {
  description = "AWS region"
  type        = string
  default     = "il-central-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "EKS_terraform"
}

variable "app_name" {
  description = "Name of My Application"
  type        = string
  default     = "weather-app"
}

variable "service_type" {
  description = "Name of Service"
  type        = string
  default     = "NodePort"
}

variable "image_name" {
  description = "Name of Image"
  type        = string
  default     = "ortoledanoo/weather-app"
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


