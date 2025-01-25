module "eks" {
  source = "./modules/eks"

  environment     = var.environment
  vpc_id          = "vpc-0f3f8e65832edef28"
  private_subnets = ["subnet-08eb8ed906ce3e488", "subnet-09ebdcc1d8e15ad05"]
  cluster_version = var.cluster_version
  instance_type   = var.instance_type
}