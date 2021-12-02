module "networking" {
  source    = "terraform-aws-modules/modules/networking"
  namespace = var.namespace
}

module "ssh-key" {
  source    = "terraform-aws-modules/modules/ssh-key"
  namespace = var.namespace
}

module "ec2" {
  source     = "terraform-aws-modules/modules/ec2"
  namespace  = var.namespace
  vpc        = module.networking.vpc
  sg_pub_id  = module.networking.sg_pub_id
  sg_priv_id = module.networking.sg_priv_id
  key_name   = module.ssh-key.key_name
}

