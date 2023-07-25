# terraform {
#   required_providers {
#     openstack = {
#       source = "terraform-provider-openstack/openstack"
#     }
#   }
#   required_version = ">= 0.13.1"
# }

provider "openstack" {
  auth_url            = var.openstack_auth_url
  tenant_name         = var.openstack_tenant_name
  user_name           = var.openstack_user_name
  password            = var.openstack_password
  region              = var.openstack_region
  user_domain_name    = var.openstack_user_domain_name
  project_domain_name = var.openstack_project_domain_name
}

resource "openstack_compute_instance_v2" "my_instance" {
  name            = var.vm_name
  region          = var.region
  image_id        = var.image_id
  flavor_id       = var.flavor_id
  key_pair        = var.key_name
  security_groups = var.security_groups

  network {
    name = var.network_name
  }

}

variable "openstack_auth_url" {
  type = string
}

variable "openstack_tenant_name" {
  type = string
}

variable "openstack_user_name" {
  type = string
}

variable "openstack_password" {
  type = string
}

variable "openstack_region" {
  type = string
}

variable "openstack_user_domain_name" {
  type = string
}

variable "openstack_project_domain_name" {
  type = string
}

varable "vm_name" {
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

# module "keypair" {
#   source           = "./modules/keypair"
#   cluster_name     = "test"
#   ssh_keypair_name = "etesami-key"
#   ssh_key_file     = var.ssh_key_file
#   ssh_keypair_name = var.ssh_keypair_name
# }


# module "controlplane" {
#   source           = "remche/rke2/openstack"
#   cluster_name     = var.cluster_name
#   write_kubeconfig = true
#   image_name       = "ubuntu-20.04-focal-x86_64"
#   flavor_name      = "genX1"
#   public_net_name  = "dmz"
#   rke2_config      = file("server.yaml")
#   manifests_path   = "./manifests"
#   # Fix for https://github.com/rancher/rke2/issues/1113
#   additional_san = ["kubernetes.default.svc"]
# }

# module "worker" {
#   source      = "remche/rke2/openstack//modules/agent"
#   image_name  = "ubuntu-20.04-focal-x86_64"
#   nodes_count = 2
#   name_prefix = "worker"
#   flavor_name = "genX1"
#   node_config = module.controlplane.node_config
# }
