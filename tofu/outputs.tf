# ─────────────────────────────────────────────
# VM info
# ─────────────────────────────────────────────
output "vm_ip" {
  value       = uca_server.vm.ipv4
  description = "Public IPv4 address of the VM"
}

output "vm_ssh_command" {
  value       = "ssh -i ~/.ssh/tp_vm_key ${var.vm_username}@${uca_server.vm.ipv4}"
  description = "Ready-to-copy SSH command to connect to the VM"
}

output "vm_dns" {
  value       = "${var.isima_username}.uca-devops.ovh"
  description = "DNS name pointing to the VM"
}

# ─────────────────────────────────────────────
# Database info (sensitive — won't print by default)
# ─────────────────────────────────────────────
output "mysql_host" {
  value       = clevercloud_addon.database.configurations["MYSQL_ADDON_HOST"]
  description = "MySQL host (Clever Cloud)"
  sensitive   = true
}

output "mysql_database" {
  value       = clevercloud_addon.database.configurations["MYSQL_ADDON_DB"]
  description = "MySQL database name"
  sensitive   = true
}

output "mysql_user" {
  value       = clevercloud_addon.database.configurations["MYSQL_ADDON_USER"]
  description = "MySQL username"
  sensitive   = true
}

# Reminder: full credentials are also written to tofu/mysql.sh by database.tf
output "mysql_credentials_file" {
  value       = "Credentials written to: ${path.module}/mysql.sh (run 'source mysql.sh' to load them)"
  description = "Where to find the full DB credentials"
}