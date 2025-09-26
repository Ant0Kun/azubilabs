variable "lxcs" {
  type = map(object({
    hostname = string
  
  }))

  default = {
    lxc1 = { hostname = "vaultwarden"}
    lxc7 = { hostname = "opencloud"}
    lxc8 = { hostname = "openbao"}
    lxc9 = { hostname = "nginxproxymanager"}
    lxc10 = { hostname = "bilal-cloud01"}
    lxc11 = { hostname = "bilal-cloud02"}
    lxc12 = { hostname = "bilal-LB"}
    lxc13 = { hostname = "bilal-DB"}
    lxc20 = { hostname = "kilian-nextcloud" }
  }
}

variable "k3s" {
  type = map(object({
    hostname = string
    ip = string
  
  }))

  default = {
    k3s0 = { hostname = "k3s-control", ip = "10.0.10.90" }
    k3s1 = { hostname = "k3s-worker01", ip = "10.0.10.91" }
    k3s2 = { hostname = "k3s-worker02", ip = "10.0.10.92" }
    k3s3 = { hostname = "k3s-worker03", ip = "10.0.10.93" }

  }
}
