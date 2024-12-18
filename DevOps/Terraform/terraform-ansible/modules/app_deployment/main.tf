resource "null_resource" "ansible_provisioner" {
  triggers = {
    instance_ip = var.instance_ip
  }

  provisioner "local-exec" {
    working_dir = path.module # Set working directory to module directory
    command     = <<EOT
      {
        echo "[weather-app]"
        echo "${var.instance_ip}"
      } > inventory
      sleep 90
      ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory -u ${var.ssh_user} ${var.playbook_path}
    EOT
  }
}