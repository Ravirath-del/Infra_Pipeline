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