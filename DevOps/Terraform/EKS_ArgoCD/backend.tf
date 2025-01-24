terraform {
  backend "s3" {
    bucket         = "ex4-or-toledano-bucket-tf"
    region         = "il-central-1"
    dynamodb_table = "terraform_state_lock"
    key            = "eks-argocd.tfstate"
    encrypt        = true
  }
}