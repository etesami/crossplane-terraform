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

variable "vm_name" {
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