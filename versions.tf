provider "openstack" {
  auth_url           = var.auth_url
  tenant_name        = var.tenant_name
  user_name          = var.user_name
  password           = var.password
  region             = var.region
  user_domain_name   = var.user_domain_name
  project_domain_name = var.project_domain_name
}