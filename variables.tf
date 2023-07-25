# variable "openstack_auth_url" {
#   type = string
# }

# variable "openstack_tenant_name" {
#   type = string
# }

# variable "openstack_user_name" {
#   type = string
# }

# variable "openstack_password" {
#   type = string
# }

# variable "openstack_region" {
#   type = string
# }

# variable "openstack_user_domain_name" {
#   type = string
# }

# variable "openstack_project_domain_name" {
#   type = string
# }

variable "vm_name" {
  type = string
} 

variable "region" {
  type = string
}

variable "image_id" {
  type = string
}

variable "flavor_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "security_groups" {
  type = list(string)
}

variable "network_name" {
  type = string
}