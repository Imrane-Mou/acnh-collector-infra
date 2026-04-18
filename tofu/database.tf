# ─────────────────────────────────────────────
# MySQL database on Clever Cloud (free DEV plan)
# ─────────────────────────────────────────────
resource "clevercloud_addon" "database" {
  name                 = var.db_name
  plan                 = "dev"
  third_party_provider = "mysql-addon"
  region               = "par"
}

# ─────────────────────────────────────────────
# Export DB credentials to a local mysql.sh file
# (so we can source it later to connect / for Ansible)
# ─────────────────────────────────────────────
resource "local_sensitive_file" "mysql_credentials" {
  filename = "${path.module}/mysql.sh"
  content = templatefile("${path.module}/mysql.sh.template", {
    config = clevercloud_addon.database.configurations
  })
  file_permission = "0600"
}