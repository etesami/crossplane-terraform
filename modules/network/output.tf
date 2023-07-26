output "network_name" {
  value = openstack_networking_network_v2.nodes_net[0].name
}

output "subnet_name" {
  value = openstack_networking_subnet_v2.nodes_subnet[0].name
}
