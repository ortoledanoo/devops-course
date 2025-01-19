module "vpc" {
  source = "../../modules/vpc"

  project_name         = "my-eks"
  cidr_block          = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones   = ["il-central-1a", "il-central-1b"]
}

module "eks" {
  source = "../../modules/eks"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids
}

# Move the data source before the providers
data "aws_eks_cluster" "this" {
  name = module.eks.cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = module.eks.cluster_name
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.this.token
}

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.this.token
  }
}

module "alb_controller" {
  source = "../../modules/alb-controller"

  cluster_name   = module.eks.cluster_name
  oidc_provider  = module.eks.oidc_provider
  region         = "il-central-1"
  vpc_id         = module.vpc.vpc_id
}

module "weather_app" {
  source = "../../modules/app_deployment"
  public_subnet_ids = module.vpc.public_subnet_ids
}