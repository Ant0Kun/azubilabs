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
  memory      = 2048
  disk {
    size    = "10G"
    type    = "scsi"
    storage = "local-lvm"
  }
}

