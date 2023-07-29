variable "nodes_count" {
  type = number
}

variable "name_prefix" {
  type = string
}

variable "cluster_name" {
  type = string
}

# TODO: remove this variable?
variable "image_id" {
  type = string
}

variable "image_name" {
  type = string
}

variable "flavor_name" {
  type = string
}

variable "keypair_name" {
  type = string
}

variable "public_key" {
  type        = string
  default     = ""
}

variable "system_user" {
  type        = string
  default     = "ubuntu"
  description = "Default OS image user"
}

variable "network_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "secgroup_id" {
  type = string
}

variable "assign_floating_ip" {
  type    = bool
  default = false
}

variable "floating_ip_pool" {
  type = string
}

variable "rke2_version" {
  type = string
}

variable "rke2_config" {
  type    = string
  default = ""
}

variable "bootstrap_server" {
  type    = string
  default = ""
}

variable "bastion_host" {
  type    = string
  default = ""
}

variable "is_server" {
  type    = bool
  default = true
}

variable "rke2_token" {
  type    = string
  default = ""
}

variable "additional_san" {
  type        = list(string)
  default     = []
  description = "RKE additional SAN"
}

variable "manifests_path" {
  type        = string
  default     = ""
  description = "RKE2 addons manifests directory"
}
