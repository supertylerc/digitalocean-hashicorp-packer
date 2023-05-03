dnf update -y
dnf install -y dnf-plugins-core
dnf config-manager -y --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
dnf config-manager -y --add-repo https://pkgs.tailscale.com/stable/fedora/tailscale.repo
dnf -y install consul tailscale
sudo systemctl enable --now tailscaled
