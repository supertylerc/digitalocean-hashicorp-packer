# Configure Consul Client
cat <<EOF > /etc/consul.d/client.hcl
auto_encrypt = {
  tls = true
}
EOF

# Download and Install Nomad
curl -fL \
  "https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip" \
  | gunzip > /usr/local/bin/nomad
chmod a+x /usr/local/bin/nomad
nomad -version

mkdir -p /etc/nomad.d
mkdir -p /opt/nomad/data
cat <<EOF > /etc/nomad.d/common.hcl
bind_addr = "{{ GetInterfaceIP \"tailscale0\" }}"
datacenter = "${CONSUL_DC}"
data_dir = "/opt/nomad/data"
advertise {
  http = "{{ GetInterfaceIP \"tailscale0\" }}"
  rpc  = "{{ GetInterfaceIP \"tailscale0\" }}"
  serf = "{{ GetInterfaceIP \"tailscale0\" }}"
}
EOF

cat <<'EOF' > /etc/systemd/system/nomad.service
[Unit]
Description=Nomad
Documentation=https://nomadproject.io/docs/
Wants=network-online.target consul.service
After=network-online.target consul.service sys-subsystem-net-devices-tailscale0.device tailscaled.service

[Service]
EnvironmentFile=-/etc/nomad.d/nomad.env
ExecReload=/bin/kill -HUP $MAINPID
ExecStart=/usr/local/bin/nomad agent -config /etc/nomad.d
KillMode=process
KillSignal=SIGINT
LimitNOFILE=65536
LimitNPROC=infinity
Restart=on-failure
RestartSec=2

TasksMax=infinity
OOMScoreAdjust=-1000

[Install]
WantedBy=multi-user.target

[Service]
TimeoutStopFailureMode=abort
EOF
systemctl enable nomad
