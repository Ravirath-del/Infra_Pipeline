Rgs = {
  Rg1 = {
    name     = "ganesha"
    location = "east us"
  }
}
vnet = {
  vnet1 = {
    name                = "ganesha_vnet"
    location            = "east us"
    resource_group_name = "ganesha"
    address_space       = ["10.0.0.0/16"]


    subnet = [
      {
        name             = "ganesha_frontendsubnet"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "ganesha_backend"
        address_prefixes = ["10.0.2.0/24"]
      },

    ]
  }
}
pip = {
  pip1 = {
    name                = "frontend_ip"
    resource_group_name = "ganesha"
    location            = "east us"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "backend_ip"
    resource_group_name = "ganesha"
    location            = "east us"
    allocation_method   = "Static"
  }
}
nic = {
  nic1 = {
    name                = "frontend_nic"
    location            = "east us"
    resource_group_name = "ganesha"
    subnet_key          = "frontend"
    ip_name             = "frontend"
    pip_key="frontend_ip"


    #   ip_configuration = {

    #     name                       = "frontend_ip"
    #    # private_ip_address_allocation = "Dynamic"
    #     #subnet_id                     = data.azurerm_subnet.frontend.id

    #  #}
  }
  nic2 = {
    name                = "backend_nic"
    location            = "east us"
    resource_group_name = "ganesha"
    subnet_key          = "backend"
    ip_name             = "backend"
     pip_key="backend_ip"

    # ip_configuration = {

    #   name                       = "frontend_ip"
    #   private_ip_address_allocation = "Dynamic"
    #   #subnet_id                     = data.azurerm_subnet.backend.id

    # }
  }
}
vm = {
  vm1 = {
    name                = "frontendvm"
    location            = "east us"
    resource_group_name = "ganesha"
    #network_interface_ids = [var.nic_id[each.value.nic_key]]
    size                            = "Standard_DC1ds_v3"
    #  admin_username                  = "vm-admin-username"
    #  admin_password                  = "vm-admin-password"
    disable_password_authentication = "false"
    nic_key                         = "frontend"
     username_secret = "vm-admin-username26"
    password_secret = "vm-admin-password26"

  }
  vm2 = {
    name                = "backendvm"
    location            = "east us"
    resource_group_name = "ganesha"
    #network_interface_ids = [var.nic_id[each.value.nic_key]]
    size = "Standard_DC1ds_v3"
  #  admin_username                  = "vm-admin-username1"
  #    admin_password                  = "vm-admin-password1"
    disable_password_authentication = "false"
    nic_key                         = "backend"
      username_secret = "vm-admin-username49"
    password_secret = "vm-admin-password49"
   
  }
}
nsg = {
  nsg1 = {
    name                = "frontendnsg"
    location            = "east us"
    resource_group_name = "ganesha"
    security_rule       = "frontendnsg"
    subnet_key          = "frontend"
  }
  nsg2 = {
    name                = "backendnsg"
    location            = "east us"
    resource_group_name = "ganesha"
    security_rule       = "backendnsg"
    subnet_key          = "backend"
  }
}
kv = {
  kv1 = {
    name                        = "frontendvmkeyvault"
    location                    = "east us"
    resource_group_name         = "ganesha"
    enabled_for_disk_encryption = true
    #tenant_id                   = data.azurerm_client_config.current.tenant_id
    soft_delete_retention_days = 7
    purge_protection_enabled   = true
    sku_name                   = "standard"
  }
}
vm_user = {
  vm_user1 = {
    name  = "vm-admin-username36"
    value = "useradmin123"
  }
  vm_user2={
     name  = "vm-admin-username59"
    value = "useradmin123"
  }
}
vm_pass = {
  vm_pass1 = {
    name  = "vm-admin-password36"
    value = "useradmin@1234567"
  }
   vm_pass2 = {
    name  = "vm-admin-password59"
    value = "useradmin@12345678"
  }
}