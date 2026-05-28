module "vpc" {
  source = "github.com/LeonSebVip/terraform-aws-vpc-AUY1105-LSVP?ref=0.1.0"
}

module "ec2" {
  source = "github.com/LeonSebVip/terraform-aws-ec2-AUY1105-LSVP?ref=0.1.0"
}

module "s3" {
  source = "github.com/LeonSebVip/terraform-aws-s3-AUY1105-LSVP?ref=0.1.0"
}

module "loadbalancer" {
  source = "github.com/LeonSebVip/terraform-aws-loadbalancer-AUY1105-LSVP?ref=0.1.0"
  vpc_id = module.vpc.vpc_id
}
