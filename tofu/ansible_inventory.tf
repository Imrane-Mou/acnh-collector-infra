# ─────────────────────────────────────────────
# Auto-generate the Ansible inventory after VM creation.
# Every `tofu apply` writes this file with the current VM IP,
# so Ansible always targets the right machine — no manual edits.
# ─────────────────────────────────────────────
resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/inventories/prod/inventory"
  content  = <<-EOT
    [servers]
    ${uca_server.vm.ipv4}

    [servers:vars]
    ansible_user=${var.vm_username}
    ansible_ssh_private_key_file=~/.ssh/tp_vm_key
    ansible_python_interpreter=/usr/bin/python3
  EOT

  file_permission = "0644"
}
