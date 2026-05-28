output "vpc_id" {
  description = "ID de la VPC"
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  description = "IDs de subredes"
  value = module.vpc.subnet_ids
}

output "sg_web_id" {
  description = "ID del SG de EC2"
  value = module.vpc.sg_web_id
}

output "sg_alb_id" {
  description = "ID del SG de ALB"
  value = module.vpc.sg_alb_id
}