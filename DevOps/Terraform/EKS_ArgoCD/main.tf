module "eks" {
  source = "./modules/eks"

  environment     = var.environment
  vpc_id          = "vpc-0f3f8e65832edef28"
  private_subnets = ["subnet-08eb8ed906ce3e488", "subnet-09ebdcc1d8e15ad05"]
  cluster_version = var.cluster_version
  instance_type   = var.instance_type

}

module "alb" {
  source = "./modules/alb"

  cluster_name                       = module.eks.cluster_name
  vpc_id                             = "vpc-0f3f8e65832edef28"
  cluster_endpoint                   = module.eks.cluster_endpoint
  cluster_certificate_authority_data = module.eks.cluster_certificate_authority_data
  oidc_provider_arn                  = module.eks.oidc_provider_arn

  depends_on = [module.eks]
}

module "argocd" {
  source = "./modules/argocd"

  cluster_name      = module.eks.cluster_name
  vpc_id            = "vpc-0f3f8e65832edef28"
  oidc_provider_arn = module.eks.oidc_provider_arn

  depends_on = [module.alb]
}

# argocd admin export -n argocd > argocd-backup.yml
# kubectl apply -f argocd-backup.yml -n argocd
