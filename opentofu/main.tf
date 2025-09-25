terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc03" # or latest tested version
    }
  }
}




provider "proxmox" {

  pm_api_url = "http://10.0.10.130:8006/api2/json"
  pm_api_token_id = "opentofu@pve!opentofu"
  pm_api_token_secret = "fcfc76ac-5c7a-4133-b33f-04ae8d4a1bf1"
  pm_tls_insecure      = true
  pm_minimum_permission_check = false
}


resource "proxmox_lxc" "lxcs" {
  for_each = var.lxcs

  hostname     = each.value.hostname
  ostemplate   = "cephfs:vztmpl/ubuntu-25.04-standard_25.04-1.1_amd64.tar.zst"
  target_node  = "hulk" # Your Proxmox node name
  password     = "universa"
  cores        = 2
  memory       = 2048
  swap         = 2048
  unprivileged = true
  start        = true

  tty          = 1
  console      = true

  rootfs {
    storage = "cephRBD"
    size    = "8G"
  }
#  ssh_public_keys = <<EOF
#ssh-rsa AAAAB3...your-key
#EOF

  features {
    nesting = true
  }


  network {
    name   = "eth0"
    bridge = "vmbr0v500"
    #ip     = "${each.value.ip}/27"
    #gw     = "10.0.10.94" # Set your gateway here
    ip = "dhcp"
  }



}


resource "proxmox_vm_qemu" "k3s" {

  for_each = var.k3s

  name        = each.value.hostname
  target_node = "ironman"
  clone      = "ubuntu-cloudinit-template"
  full_clone = true

  agent   = 1
  cores   = 4
  sockets = 1
  memory  = 8192


  scsihw  = "virtio-scsi-pci"
  
  disk {
    slot   = 0
    size    = "20G"
    type    = "scsi"
    storage = "cephRBD"
  }

  network {
    id     = "net0"
    model  = "virtio"
    bridge = "vmbr0v500"
    
  }

  ciuser     = "ubuntu"
  cipassword = "changeme"
  ipconfig0  = "ip=dhcp"
}

