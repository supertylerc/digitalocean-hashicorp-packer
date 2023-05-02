source "digitalocean" "base" {
  image            = var.base_os_slug
  region           = var.region
  size             = var.size
  snapshot_regions = var.snapshot_regions
  ssh_username     = var.ssh_username
  ipv6             = true
  state_timeout    = "15m"
  ssh_timeout      = "15m"
}

# Consul
build {
  name = "consul"
  source "digitalocean.base" {
    droplet_name  = "consul-packer"
    snapshot_name = "consul-${var.base_os_slug}"
    tags          = concat(var.tags, ["consul"])
  }
  provisioner "shell" {
    scripts = [
      "scripts/common.sh",
      "scripts/consul.sh",
    ]
  }
}

# Nomad
build {
  name = "nomad"
  source "digitalocean.base" {
    droplet_name  = "nomad-packer"
    snapshot_name = "nomad-${var.base_os_slug}"
    tags          = concat(var.tags, ["nomad"])
  }
  provisioner "shell" {
    scripts = [
      "scripts/common.sh",
      "scripts/nomad.sh",
    ]
  }
}
