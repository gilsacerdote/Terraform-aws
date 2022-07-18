module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.13.0"

  name = "VPC-Teste-${var.environment}"
  cidr = "10.0.0.0/16"

  azs              = ["us-east-1a", "us-east-1c"]
  private_subnets  = ["10.0.10.0/24", "10.0.20.0/24"]
  public_subnets   = ["10.0.30.0/24", "10.0.40.0/24"]
  # em caso de uso de BD
  # database_subnets = ["172.31.12.0/23", "172.31.14.0/23"]

  enable_nat_gateway                 = true
  enable_dns_hostnames               = true
  enable_dns_support                 = true
  single_nat_gateway                 = true
  create_database_subnet_route_table = true
  create_database_nat_gateway_route  = false
  create_database_subnet_group       = true
  
  tags = {
    env     = "${var.environment}"
    project = "Project-teste"
  }
}

  # Route Table
  
  
