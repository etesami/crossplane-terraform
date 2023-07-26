# output "keypair_name" {
#   value = module.keypair.keypair_name
# }

# output "keypair_private_key" {
#   value = module.keypair.keypair_private_key
#   sensitive = true
# }

output "network_name" {
  value = module.network.network_name
}

output "subnet_name" {
  value = module.network.subnet_name
}
