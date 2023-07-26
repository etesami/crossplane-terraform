variable "cluster_name" {
  type = string
}

variable "network_name" {
  type = string
  default = null
}

variable "subnet_name" {
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