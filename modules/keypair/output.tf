output "keypair_name" {
  value = openstack_compute_keypair_v2.key.name
  # value = var.ssh_keypair_name == null ? openstack_compute_keypair_v2.key[0].name : var.ssh_keypair_name
}

# output "keypair_private_key" {
#   value = var.ssh_keypair_name == null ? openstack_compute_keypair_v2.key[0].private_key : null
# }