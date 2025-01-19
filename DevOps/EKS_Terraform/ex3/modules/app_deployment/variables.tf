variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "weather-app"
}

variable "replicas" {
  description = "Number of replicas for the deployment"
  type        = number
  default     = 3
}

variable "container_image" {
  description = "Container image for the application"
  type        = string
  default     = "ortoledanoo/weather-app"
}

variable "container_port" {
  description = "Container port"
  type        = number
  default     = 5000
}

variable "service_port" {
  description = "Service port"
  type        = number
  default     = 80
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}