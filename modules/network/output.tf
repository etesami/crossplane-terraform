output "network_name" {
  value = try(openstack_networking_network_v2.nodes_net[0].name, var.network_name)
}

output "subnet_name" {
  value = try(openstack_networking_subnet_v2.nodes_subnet[0].name, var.subnet_name)
}
