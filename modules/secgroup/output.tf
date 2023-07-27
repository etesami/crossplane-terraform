output "secgroup_id" {
  value = openstack_networking_secgroup_v2.secgroup.id
}

output "secgroup_name" {
  value = openstack_networking_secgroup_v2.secgroup.name
}