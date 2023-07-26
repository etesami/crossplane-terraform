
# resource "openstack_compute_instance_v2" "my_instance" {
#   name            = var.vm_name
#   region          = var.region
#   image_id        = var.image_id
#   flavor_id       = var.flavor_id
#   key_pair        = var.key_name
#   security_groups = var.security_groups

#   network {
#     name = var.network_name
#   }

# }

module "keypair" {
  source = "./modules/keypair"
}

# resource "openstack_compute_keypair_v2" "key" {
#   name       = "test-key"
# }