# TODO: instance has count, we are returning only one instance name and ID
output "instance_name" {
  value = openstack_compute_instance_v2.instance[0].name
}
# TODO
output "instance_id" {
  value = openstack_compute_instance_v2.instance[0].id
}
