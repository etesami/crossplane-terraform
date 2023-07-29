data "openstack_images_image_v2" "image" {
  name        = var.image_name
  most_recent = true
}

resource "openstack_compute_instance_v2" "instance" {
  count        = var.nodes_count
  name         = "${var.cluster_name}-${var.name_prefix}-${format("%03d", count.index + 1)}"
  image_name   = var.image_name
  flavor_name  = var.flavor_name
  key_pair     = var.keypair_name
  user_data = base64encode(templatefile(("${path.module}/files/cloud-init.yml.tpl"),
    { cluster_name     = var.cluster_name
      bootstrap_server = var.is_server && count.index != 0 ? openstack_networking_port_v2.port[0].all_fixed_ips[0] : var.bootstrap_server
      public_address   = var.is_server ? openstack_networking_floatingip_v2.floating_ip[count.index].address : ""
      rke2_token       = var.rke2_token
      is_server        = var.is_server
      san              = openstack_networking_floatingip_v2.floating_ip[*].address
      rke2_conf        = var.rke2_config
      manifests_files  = var.manifests_path != "" ? [for f in fileset(var.manifests_path, "*.{yml,yaml}") : [f, base64gzip(file("${var.manifests_path}/${f}"))]] : []
      additional_san   = var.additional_san
      system_user      = var.system_user
  }))
  metadata = {
    rke2_version = var.rke2_version
    rke2_role    = var.is_server ? "server" : "agent"
  }

  network {
    port = openstack_networking_port_v2.port[count.index].id
  }

}

resource "openstack_networking_port_v2" "port" {
  count              = var.nodes_count
  network_id         = var.network_id
  security_group_ids = [var.secgroup_id]
  admin_state_up     = true
  fixed_ip {
    subnet_id = var.subnet_id
  }
}

resource "openstack_networking_floatingip_v2" "floating_ip" {
  count = var.assign_floating_ip ? var.nodes_count : 0
  pool  = var.floating_ip_pool
}

resource "openstack_compute_floatingip_associate_v2" "associate_floating_ip" {
  count       = var.assign_floating_ip ? var.nodes_count : 0
  floating_ip = openstack_networking_floatingip_v2.floating_ip[count.index].address
  instance_id = openstack_compute_instance_v2.instance[count.index].id
}
