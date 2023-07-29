output "keypair_name" {
  value = module.keypair.keypair_name
}

output "keypair_private_key" {
  value = module.keypair.keypair_private_key
  sensitive = true
}

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

output "router_name" {
  value = module.network.router_name
}

output "secgroup_id" {
  value = module.secgroup.secgroup_id
}

output "secgroup_name" {
  value = module.secgroup.secgroup_name
}

output "server_name" {
  value = module.server.instance_name
}

output "server_id" {
  value = module.server.instance_id
}

output "server_ip" {
  value = module.server.internal_ip
}

output "server_floating_ip" {
  value = module.server.floating_ip
}

output "agent_name" {
  value = module.agent_node.instance_name
}

output "agent_id" {
  value = module.agent_node.instance_id
}

output "agent_ip" {
  value = module.agent_node.internal_ip
}

output "agent_floating_ip" {
  value = module.agent_node.floating_ip
}