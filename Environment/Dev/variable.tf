variable "Rgs" {
  type = map(object({
    name     = string
    location = string
    # managed_by = string
    # tags       = map(string)
  }))
}
variable "vnet" {

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = optional(map(string))
    subnet = optional(list(object({
      name             = string
      address_prefixes = list(string)
    })), [])
  }))
}
variable "pip" {}
variable "nic" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    subnet_key          = string
    ip_name             = string
     pip_key=string
  }))
}
variable "vm" {}
variable "nsg" {}
variable "kv" {}
variable "vm_user" {}
variable "vm_pass" {}