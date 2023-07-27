# output "keypair_name" {
#   value = module.keypair.keypair_name
# }

# output "keypair_private_key" {
#   value = module.keypair.keypair_private_key
#   sensitive = true
# }

output "network_name" {
  value = module.network.network_name
}

output "network_id" {
  value = module.network.network_id
}

output "subnet_name" {
  value = module.network.subnet_name
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "router_id" {
  value = module.network.router_id
}

output "secgroup_id" {
  value = module.secgroup.secgroup_id
}