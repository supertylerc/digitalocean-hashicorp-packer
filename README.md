# digitalocean-hashicorp-packer

Use Packer to build Consul Server, Nomad Server, and Nomad Client base images based on Fedora
Linux.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base_os_slug"></a> [base\_os\_slug](#input\_base\_os\_slug) | Image slug to use | `string` | `"fedora-38-x64"` | no |
| <a name="input_consul_dc"></a> [consul\_dc](#input\_consul\_dc) | DC to set when building the image (for development) | `string` | `"dc1"` | no |
| <a name="input_consul_version"></a> [consul\_version](#input\_consul\_version) | Version of Consul to install | `string` | `"1.15.2"` | no |
| <a name="input_nomad_version"></a> [nomad\_version](#input\_nomad\_version) | Version of Nomad to install | `string` | `"1.5.5"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region in which to build the image | `string` | `"tor1"` | no |
| <a name="input_size"></a> [size](#input\_size) | Size slug for CPU/RAM | `string` | `"s-1vcpu-1gb"` | no |
| <a name="input_snapshot_regions"></a> [snapshot\_regions](#input\_snapshot\_regions) | Region(s) in which the image will be available | `list(string)` | <pre>[<br>  "tor1"<br>]</pre> | no |
| <a name="input_ssh_username"></a> [ssh\_username](#input\_ssh\_username) | Username when SSHing for provisioning | `string` | `"root"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the DigitalOcean instance | `list(string)` | <pre>[<br>  "dev",<br>  "packer",<br>  "fedora"<br>]</pre> | no |
