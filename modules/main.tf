terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

terraform {
backend "s3" {
  bucket         = "demo-terraform-eks-state-bucket2018"
  key            = "eks-cluster/terraform.tfstate"
  region         = "ap-southeast-2"
  dynamodb_table = "terraform-eks-state-locks"
  encrypt        = true
}

}

provider "aws" {
  region = "ap-southeast-2"
}


module "vpc" {
  source = "./modules/vpc"

  cluster_name       = var.cluster_name
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}
