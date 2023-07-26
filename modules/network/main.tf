resource "openstack_networking_network_v2" "nodes_net" {
  count                 = var.network_name == null ? 1 : 0
  name                  = "${var.cluster_name}-net"
  admin_state_up        = "true"
}

resource "openstack_networking_subnet_v2" "nodes_subnet" {
  count           = var.network_name == null ? 1 : 0
  name            = "${var.cluster_name}-subnet"
  network_id      = openstack_networking_network_v2.nodes_net[0].id
  cidr            = var.network_cidr
  ip_version      = 4
  dns_nameservers = ["8.8.8.8", "8.8.4.4"]
  gateway_ip      = var.network_gateway_ip
}

resource "openstack_networking_router_interface_v2" "router_interface" {
  count     = var.network_name == null ? 1 : 0
  router_id = var.router_id
  subnet_id = openstack_networking_subnet_v2.nodes_subnet[0].id
}


# data "openstack_networking_network_v2" "public_net" {
#   name = var.public_net_name
# }

# resource "openstack_networking_router_v2" "router" {
#   name                = var.router_name
#   admin_state_up      = true
#   external_network_id = data.openstack_networking_network_v2.public_net.id
# }