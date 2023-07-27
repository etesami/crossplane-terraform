variable "cluster_name" {
  type = string
  default = "crossplane-terrafrom"
}

variable "create_secgroup" {
  type = bool
}

variable "rules" {
  type = list(any)
}