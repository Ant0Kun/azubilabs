variable "lxcs" {
  type = map(object({
    hostname = string
    ip       = string
  }))

  default = {
    lxc1 = { hostname = "vaultwarden", ip = "10.0.10.65" }
    lxc7 = { hostname = "opencloud", ip = "10.0.10.69" }
    lxc8 = { hostname = "openbao", ip = "10.0.10.70" }
    lxc9 = { hostname = "nginxproxymanager", ip = "10.0.10.71" }
    lxc10 = { hostname = "nextcloud-bilal" }
  }
}

