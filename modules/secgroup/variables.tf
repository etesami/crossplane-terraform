variable "cluster_name" {
  type = string
  default = "crossplane-terrafrom"
}

variable "rules" {
  type = list(any)
}