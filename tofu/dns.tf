# ─────────────────────────────────────────────
# DNS A records on uca-devops.ovh pointing to the VM
# ─────────────────────────────────────────────

# Frontend: <username>.uca-devops.ovh
resource "ovh_domain_zone_record" "vm_dns" {
  zone      = "uca-devops.ovh"
  subdomain = var.isima_username
  fieldtype = "A"
  ttl       = 60
  target    = uca_server.vm.ipv4
}

# API: api.<username>.uca-devops.ovh
resource "ovh_domain_zone_record" "api_dns" {
  zone      = "uca-devops.ovh"
  subdomain = "api.${var.isima_username}"
  fieldtype = "A"
  ttl       = 60
  target    = uca_server.vm.ipv4
}
