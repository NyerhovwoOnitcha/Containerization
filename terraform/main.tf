
module "compute" {
  source   = "./modules/compute"
  keypair = var.keypair
}

module "docker" {
  source      = "./modules/docker"
  name        = var.name
  namespace   = var.namespace
  description = var.description
  #   username = var.DOCKER_USERNAME
  #   password = var.DOCKER_PASSWORD
}

