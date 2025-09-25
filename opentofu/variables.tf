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

