# ─────────────────────────────────────────────
# Write DB credentials to OpenBAO (home/imrane.moumad/mysql)
# Ansible will read them from there instead of a local file.
# ─────────────────────────────────────────────
resource "vault_kv_secret_v2" "mysql_creds" {
  mount = "home"
  name  = "imrane.moumad/mysql"

  data_json = jsonencode({
    MYSQL_HOST     = clevercloud_addon.database.configurations["MYSQL_ADDON_HOST"]
    MYSQL_PORT     = clevercloud_addon.database.configurations["MYSQL_ADDON_PORT"]
    MYSQL_DATABASE = clevercloud_addon.database.configurations["MYSQL_ADDON_DB"]
    MYSQL_USER     = clevercloud_addon.database.configurations["MYSQL_ADDON_USER"]
    MYSQL_PASSWORD = clevercloud_addon.database.configurations["MYSQL_ADDON_PASSWORD"]
  })
}
