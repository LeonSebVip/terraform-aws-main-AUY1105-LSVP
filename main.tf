module "vpc" {
  source = "./modulo_vpc"
}

module "ec2" {
  source = "./modulo_ec2"
}

module "s3" {
  source = "./modulo_s3"
}

module "loadbalancer" {
  source = "./modulo_loadbalancer"
  vpc_id = module.vpc.vpc_id
}