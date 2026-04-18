# ─────────────────────────────────────────────
# DNS A record on uca-devops.ovh pointing to the VM's IP
# ─────────────────────────────────────────────
resource "ovh_domain_zone_record" "vm_dns" {
  zone      = "uca-devops.ovh"
  subdomain = var.isima_username
  fieldtype = "A"
  ttl       = 60
  target    = uca_server.vm.ipv4
}