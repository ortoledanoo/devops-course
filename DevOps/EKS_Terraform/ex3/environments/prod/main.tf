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