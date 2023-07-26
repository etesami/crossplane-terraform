resource "openstack_compute_keypair_v2" "key" {
  name       = "${var.cluster_name}-key"
}