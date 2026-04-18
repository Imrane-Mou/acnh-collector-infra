# ─────────────────────────────────────────────
# The VM itself (ephemeral — destroyed after 4h by EduInfra)
# ─────────────────────────────────────────────
resource "uca_server" "vm" {
  name     = var.vm_name
  username = var.vm_username
  ssh_key  = var.ssh_public_key
}

# ─────────────────────────────────────────────
# Security group (= firewall) for the VM
# ─────────────────────────────────────────────
resource "uca_security_group" "sg" {
  name = "${var.vm_name}-sg"
}

# ─────────────────────────────────────────────
# Firewall rules — by default VMs accept NO traffic
# ─────────────────────────────────────────────

# Allow SSH from anywhere (so Ansible + you can connect)
resource "uca_security_rule" "allow_ssh" {
  security_group_id = uca_security_group.sg.id
  name              = "allow-ssh"
  description       = "Allow SSH from anywhere"
  protocol          = "TCP"
  port              = 22
  direction         = "inbound"
  ip_range          = "0.0.0.0/0"
}

# Allow HTTP (port 80) — for the frontend
resource "uca_security_rule" "allow_http" {
  security_group_id = uca_security_group.sg.id
  name              = "allow-http"
  description       = "Allow HTTP from anywhere"
  protocol          = "TCP"
  port              = 80
  direction         = "inbound"
  ip_range          = "0.0.0.0/0"
}

# Allow HTTPS (port 443) — in case we add TLS later
resource "uca_security_rule" "allow_https" {
  security_group_id = uca_security_group.sg.id
  name              = "allow-https"
  description       = "Allow HTTPS from anywhere"
  protocol          = "TCP"
  port              = 443
  direction         = "inbound"
  ip_range          = "0.0.0.0/0"
}

# Allow backend port (8080) — adjust if your Java app uses a different port
resource "uca_security_rule" "allow_backend" {
  security_group_id = uca_security_group.sg.id
  name              = "allow-backend"
  description       = "Allow backend Java app"
  protocol          = "TCP"
  port              = 8080
  direction         = "inbound"
  ip_range          = "0.0.0.0/0"
}

# ─────────────────────────────────────────────
# Attach the security group to the VM
# (without this, the rules exist but don't apply to the VM)
# ─────────────────────────────────────────────
resource "uca_security_group_attachment" "attach" {
  security_group_id = uca_security_group.sg.id
  server_id         = uca_server.vm.id
}
