module "network" {
  source = "./modules/network"

  cidr_block = "172.16.0.0/16"
}

module "server" {
  source = "./modules/server"

  management_server_ips = var.management.server_ips
  management_key_name = var.management.key_name

  vpc_id    = module.network.vpc_id
  subnet_id = module.network.subnet_1b_id
}