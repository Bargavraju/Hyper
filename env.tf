module "module_env" {
    source = "./modules"
    rg_location = "eastus"
    rg_name = "udemy-rg"
    vnet_name = "udemy-vnet"
    subnet_name = "udemy-snet"
    vnet_address_space = "10.20.0.0/16"
    subnet_address_prefix = "10.20.1.0/24"
    nic_name = "udemy-nic"
    ip_name = "udemy-nic-ip"

}