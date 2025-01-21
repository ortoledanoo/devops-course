output "vpc_id_output" {
  value = module.vpc.vpc_id
}

output "private_subnets_output" {
  value = module.vpc.private_subnets
}

output "public_subnets_output" {
  value = module.vpc.public_subnets
}
