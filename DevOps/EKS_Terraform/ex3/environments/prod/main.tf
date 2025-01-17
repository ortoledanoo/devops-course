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
  
  # Pass VPC information to EKS module
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids
  
  region         = "il-central-1"
  cluster_name   = "my-eks-cluster"
  cluster_version = "1.31"
}


provider "kubernetes" {
  host = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
  }
}

# Data source to get cluster info
data "aws_eks_cluster" "this" {
  name = module.eks.cluster_name
}

module "weather_app" {
  source = "../../modules/app_deployment"

  # Optional: Override default values if needed
  # app_name        = "custom-weather-app"
  # replicas        = 5
  # container_image = "different-registry/weather-app"
  # container_port  = 5000
  # service_port    = 80
}