module "vpc" {
  source = "./modules/vpc"

  environment = var.environment
  vpc_cidr    = var.vpc_cidr_block
  region      = var.region
}

module "eks" {
  source = "./modules/eks"

  environment     = var.environment
  vpc_id          = module.vpc.vpc_id_output
  private_subnets = module.vpc.private_subnets_output
  cluster_version = var.cluster_version
  instance_type   = var.instance_type

  depends_on = [module.vpc]
}

module "alb" {
  source = "./modules/alb"

  cluster_name                       = module.eks.cluster_name
  vpc_id                             = module.vpc.vpc_id_output
  cluster_endpoint                   = module.eks.cluster_endpoint
  cluster_certificate_authority_data = module.eks.cluster_certificate_authority_data
  oidc_provider_arn                  = module.eks.oidc_provider_arn

  depends_on = [module.eks]
}

module "argocd" {
  source = "./modules/argocd"

  cluster_name      = module.eks.cluster_name
  vpc_id            = module.vpc.vpc_id_output
  oidc_provider_arn = module.eks.oidc_provider_arn

  depends_on = [module.eks]
}