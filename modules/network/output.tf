output "network_name" {
  value = try(openstack_networking_network_v2.nodes_net[0].name, var.network_name)
}

output "network_id" {
  value = try(
    openstack_networking_network_v2.nodes_net[0].id, 
    data.openstack_networking_network_v2.existing_net_id.id
  )
}

output "subnet_id" {
  value = try(
    openstack_networking_subnet_v2.nodes_subnet[0].id, 
    data.openstack_networking_subnet_v2.existing_subnet_id.id
  )
}

output "subnet_name" {
  value = try(openstack_networking_subnet_v2.nodes_subnet[0].name, var.subnet_name)
}

output "router_id" {
  value = try(openstack_networking_router_v2.router[0].id, null)
}
