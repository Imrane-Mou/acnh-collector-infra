# ─────────────────────────────────────────────
# Auto-generate the Ansible inventory after VM creation.
# We use the DNS name (not IP) so the CI pipeline targets a stable name
# even when the VM gets recreated with a new IP.
# ─────────────────────────────────────────────
resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/inventories/prod/inventory"
  content  = <<-EOT
    [servers]
    ${var.isima_username}.uca-devops.ovh

    [servers:vars]
    ansible_user=${var.vm_username}
    ansible_ssh_private_key_file=~/.ssh/tp_vm_key
    ansible_python_interpreter=/usr/bin/python3
  EOT

  file_permission = "0644"

  depends_on = [ovh_domain_zone_record.vm_dns]
}
