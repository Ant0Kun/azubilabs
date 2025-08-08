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
  pm_api_token_id = "terraform@pam!terraform"
  pm_api_token_secret = "bd18aeb4-51b6-442a-849e-3302f6e59c17"
}


resource "proxmox_lxc" "lxcs" {
  for_each = var.lxcs

  hostname     = each.value.hostname
  ostemplate   = "local:vztmpl/ubuntu-25.04-standard_25.04-1.1_amd64.tar.zst"
  target_node  = "Hulk" # Your Proxmox node name
  password     = "universa"
  cores        = 1
  memory       = 512
  swap         = 512
  unprivileged = true
  start        = true


  rootfs {
    storage = "Storage1_Hulk"
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
}

