variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    port        = number
    cidr        = string
    description = string
  }))
}