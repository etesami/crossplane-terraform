output "secgroup_id" {
  value = openstack_networking_secgroup_v2.secgroup[0].id
}