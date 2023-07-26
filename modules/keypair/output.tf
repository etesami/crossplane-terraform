output "keypair_name" {
  value = openstack_compute_keypair_v2.key.name
}

output "keypair_private_key" {
  value = openstack_compute_keypair_v2.key.private_key
}