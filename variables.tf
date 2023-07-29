variable "cluster_name" {
  type = string
  default = "cptf"
}

# ##############################################

variable "create_network" {
  type = bool
}

variable "create_secgroup" {
  type = bool
}

variable "existing_network_name" {
  type = string
  default = null
}

variable "existing_subnet_name" {
  type = string
  default = null
}

variable "network_cidr" {
  type = string
  default = null
}

variable "network_gateway_ip" {
  type = string
  default = null
}

variable "router_id" {
  type = string
  default = null
}

variable "public_net_name" {
  type = string
  default = null
}

variable "secgroup_rules" {
  type = list(any)
  default = [
    { "source" = "0.0.0.0/0", "protocol" = "tcp", "port" = 22 },
    { "source" = "0.0.0.0/0", "protocol" = "tcp", "port" = 6443 },
    { "source" = "0.0.0.0/0", "protocol" = "tcp", "port" = 80 },
    { "source" = "0.0.0.0/0", "protocol" = "tcp", "port" = 443 }
  ]
  description = "Security group rules"
}

# ##############################################

variable "write_kubeconfig" {
  type        = bool
  default     = "false"
  description = "Write kubeconfig file to disk"
}

variable "output_kubernetes_config" {
  type        = bool
  default     = "false"
  description = "Output Kubernetes config to state (for use with Kubernetes provider)"
}

# ##############################################

variable "existing_public_key" {
  type        = string
  default     = ""
}

variable "keypair_name" {
  type        = string
  default     = ""
}

variable "image_id" {
  type        = string
  default     = "0be9b209-5e60-432d-8318-65ffd3043bd0"
}

variable "image_name" {
  type        = string
  default     = "Ubuntu-20-04-focal"
}

variable "nodes_count" {
  type        = number
  default     = 1
}

variable "agents_count" {
  type        = number
  default     = 1
}

variable "flavor_name" {
  type        = string
  default     = "p3.large"
}

variable "ssh_private_key" {
  type        = string
  default     = ""
}

# variable "server_group_affinity" {
#   type        = string
#   default     = "soft-anti-affinity"
#   description = "Server group affinity"
# }

# variable "user_data_file" {
#   type        = string
#   default     = null
# }

# variable "availability_zones" {
#   type        = list(string)
#   default     = []
#   description = "The list of AZs to deploy nodes into"
# }

variable "rke2_version" {
  type        = string
  default     = ""
  description = "RKE2 version"
}

variable "rke2_config" {
  type        = string
  default     = ""
  description = "RKE2 config contents"
}

# variable "containerd_config_file" {
#   type        = string
#   default     = ""
#   description = "containerd config file for servers"
# }

# variable "registries_conf" {
#   type        = string
#   default     = ""
#   description = "Containerd registries config in gz+b64"
# }

variable "additional_san" {
  type        = list(string)
  default     = []
  description = "RKE2 additional SAN"
}

variable "manifests_path" {
  type        = string
  default     = ""
  description = "RKE2 addons manifests directory"
}

variable "system_user" {
  type        = string
  default     = "ubuntu"
  description = "Default OS image user"
}

# variable "manifests_gzb64" {
#   type        = map(string)
#   default     = {}
#   description = "RKE2 addons manifests in gz+b64 in the form { \"addon_name\": \"gzb64_manifests\" }"
# }

# variable "do_upgrade" {
#   type        = bool
#   default     = false
#   description = "Trigger upgrade provisioner"
# }

# ##############################################

variable "auth_url" {
  type = string
}

variable "tenant_name" {
  type = string
}

variable "user_name" {
  type = string
}

variable "password" {
  type = string
}

variable "region" {
  type = string
}

variable "user_domain_name" {
  type = string
}

variable "project_domain_name" {
  type = string
}
