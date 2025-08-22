terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.14" # or latest tested version
    }
  }
}




provider "proxmox" {

  pm_api_url = "http://10.0.10.131:8006/api2/json"
  pm_api_token_id = "opentofu@pam!opentofu"
  pm_api_token_secret = "be4f3ac7-2fbf-4c1b-b8e2-95d83c4fdb2b"
}


resource "proxmox_lxc" "lxcs" {
  for_each = var.lxcs

  hostname     = each.value.hostname
  ostemplate   = "local:vztmpl/ubuntu-25.04-standard_25.04-1.1_amd64.tar.zst"
  target_node  = "hulk" # Your Proxmox node name
  password     = "universa"
  cores        = 1
  memory       = 512
  swap         = 512
  unprivileged = true
  start        = true


  rootfs {
    storage = "cephfs"
    size    = "4G"
  }
#  ssh_public_keys = <<EOF
#ssh-rsa AAAAB3...your-key
#EOF

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "${each.value.ip}/24"
    gw     = "192.168.100.1" # Set your gateway here
  }


  connection {
    type     = "ssh"
    host     = each.value.ip
    user     = "root"
    password = "universa"

  }

  provisioner "remote-exec" {
    inline = [
    " touch /root/hallo.txt"
    ]
  }




}

