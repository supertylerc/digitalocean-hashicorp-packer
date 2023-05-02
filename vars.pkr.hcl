variable "base_os_slug" {
  description = "Image slug to use"
  type = string
  default = "fedora-37-x64"
}

variable "region" {
  description = "Region in which to build the image"
  type = string
  default = "tor1"
}

variable "size" {
  description = "Size slug for CPU/RAM"
  type = string
  default = "s-1vcpu-1gb"
}

variable "snapshot_regions" {
  description = "Region(s) in which the image will be available"
  type = list(string)
  default = [
    "tor1",
  ]
}
variable "ssh_username" {
  description = ""
  type = string
  default = "root"
}

variable "tags" {
  description = ""
  type = list(string)
  default = [
    "dev",
    "packer",
    "fedora",
  ]
}
