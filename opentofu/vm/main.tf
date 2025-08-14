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



resource "proxmox_vm_qemu" "test-ci" {
  name        = "test-ci"
  target_node = "hulk"
  clone       = "ubuntu-cloudinit"  # Name of the Proxmox template
  full_clone  = true

  # Cloud-init settings
  ciuser      = "ubuntu"
  cipassword  = "supersecurepassword"
  sshkeys     = file("~/.ssh/id_rsa.pub")
  ipconfig0   = "ip=192.168.10.50/24,gw=192.168.10.1"
  nameserver  = "192.168.10.1"

  cores       = 2
  sockets     = 1
  memory      = 2048
  disk {
    size    = "10G"
    type    = "scsi"
    storage = "local-lvm"
    slot    = 0
  }
}

