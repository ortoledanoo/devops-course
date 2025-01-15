module "vpc" {
  source = "../../modules/vpc"

  cidr_block           = "10.0.0.0/16"
  public_subnet_cidr   = "10.0.1.0/24"
  private_subnet_cidr  = "10.0.2.0/24"
  project_name         = "my-project"
}

module "security_group" {
  source = "../../modules/security_group"
  # Allow Inboud From ->
  ingress_rules = [
    { port = 22, cidr = "213.57.121.34/32", description = "Allow SSH" },
    { port = 80, cidr = "0.0.0.0/0", description = "Allow HTTP" },
    { port = 443, cidr = "0.0.0.0/0", description = "Allow HTTPS" },
    { port = 5000, cidr = "0.0.0.0/0", description = "Allow Python-WeatherApp" }
  ]
}

module "eks_cluster" {
  source = "../../modules/eks_cluster"

  cluster_name                      = "my-eks-cluster"
  cluster_version                   = "1.31"
  vpc_id                            = module.vpc.vpc_id
  subnet_ids                        = [module.vpc.public_subnet_id]
  control_plane_subnet_ids          = [module.vpc.private_subnet_id]
  cluster_endpoint_public_access    = true
  enable_cluster_creator_admin_permissions = true

  # Managed Node Group Variables
  default_instance_types = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"]
  eks_managed_node_groups = {
    example = {
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t3.medium"]
      min_size       = 2
      max_size       = 10
      desired_size   = 2
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
