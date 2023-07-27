resource "openstack_networking_network_v2" "nodes_net" {
  count                 = var.create_network ? 1 : 0
  name                  = var.network_name != null ? var.network_name : "${var.cluster_name}-net"
  admin_state_up        = "true"
}

resource "openstack_networking_subnet_v2" "nodes_subnet" {
  count           = var.create_network ? 1 : 0
  name            = var.subnet_name != null ? var.subnet_name : "${var.cluster_name}-subnet"
  network_id      = openstack_networking_network_v2.nodes_net[0].id
  cidr            = var.network_cidr != null ? var.network_cidr : "10.30.199.0/24"
  gateway_ip      = var.network_gateway_ip != null ? var.network_gateway_ip : "10.30.199.1"
  ip_version      = 4
  dns_nameservers = ["8.8.8.8", "8.8.4.4"]
}

resource "openstack_networking_router_v2" "router" {
  count           = var.create_network ? 1 : 0
  name                = "${var.cluster_name}-router"
  admin_state_up      = true
  external_network_id = data.openstack_networking_network_v2.public_net.id
}

resource "openstack_networking_router_interface_v2" "router_interface" {
  count     = var.create_network ? 1 : 0
  router_id = openstack_networking_router_v2.router[0].id
  subnet_id = openstack_networking_subnet_v2.nodes_subnet[0].id
}
