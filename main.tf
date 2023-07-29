
module "keypair" {
  source           = "./modules/keypair"
  cluster_name     = var.cluster_name
}

module "secgroup" {
  source          = "./modules/secgroup"
  cluster_name    = var.cluster_name
  rules           = var.secgroup_rules
}

module "network" {
  source              = "./modules/network"
  cluster_name        = var.cluster_name

  # For testing purposes, instances can connect to 
  # an existing network and subnet. If this is false,
  # then there is a need to create a router and give
  # the router public IP and connect the router the
  # created subnet. However, due to the internal network design,
  # instances are only reachable when they have public IP.
  create_network          = var.create_network
  
  # Required if create_network is true
  public_net_name         = var.public_net_name
  existing_network_name   = var.existing_network_name
  existing_subnet_name    = var.existing_subnet_name
  network_cidr            = var.network_cidr
  network_gateway_ip      = var.network_gateway_ip
  router_id               = var.router_id
}


module "server" {
  source                 = "./modules/instance"
  name_prefix            = "server"
  cluster_name           = var.cluster_name
  nodes_count            = var.nodes_count
  image_name             = var.image_name
  image_id               = var.image_id
  flavor_name            = var.flavor_name
  keypair_name           = var.keypair_name != null ? var.keypair_name : module.keypair.keypair_name
  network_id             = module.network.network_id
  subnet_id              = module.network.subnet_id
  secgroup_id            = module.secgroup.secgroup_id
  # TODO: check flating ip works
  assign_floating_ip     = "true"
  floating_ip_pool       = var.public_net_name
  rke2_version           = var.rke2_version
  rke2_config            = var.rke2_config
  rke2_token             = random_string.rke2_token.result
  additional_san         = var.additional_san
  manifests_path         = var.manifests_path
  system_user            = var.system_user
}

module "agent_node" {
  source                 = "./modules/instance"
  name_prefix            = "agent"
  cluster_name           = var.cluster_name
  nodes_count            = var.agents_count
  image_name             = var.image_name
  image_id               = var.image_id
  flavor_name            = var.flavor_name
  keypair_name           = var.keypair_name != null ? var.keypair_name : module.keypair.keypair_name
  network_id             = module.network.network_id
  subnet_id              = module.network.subnet_id
  secgroup_id            = module.secgroup.secgroup_id
  is_server              = "false"
  # TODO: check flating ip works
  assign_floating_ip     = "false"
  floating_ip_pool       = var.public_net_name
  rke2_version           = var.rke2_version
  rke2_config            = var.rke2_config
  rke2_token             = random_string.rke2_token.result
  additional_san         = var.additional_san
  manifests_path         = var.manifests_path
  system_user            = var.system_user
  bootstrap_server       = module.server.internal_ip[0]
}

resource "random_string" "rke2_token" {
  length = 64
}