module "network" {
  source                  = "CiscoDevNet/secure-firewall/aws//modules/Network/"
  vpc_name                = var.vpc_name
  vpc_cidr                = var.vpc_cidr
  create_igw              = var.create_igw
  availability_zone_count = var.availability_zone_count
  instances_per_az        = var.instances_per_az
  inside_subnet_cidr      = var.inside_subnet_cidr
  outside_subnet_cidr     = var.outside_subnet_cidr
  diag_subnet_cidr        = var.diag_subnet_cidr
  mgmt_subnet_cidr        = var.mgmt_subnet_cidr

  ftd_mgmt_ip             = var.ftd_mgmt_ip
  ftd_outside_ip          = var.ftd_outside_ip
  ftd_diag_ip             = var.ftd_diag_ip
  ftd_inside_ip           = var.ftd_inside_ip
  fmc_ip                  = var.fmc_ip

  inside_subnet_name      = var.inside_subnet_name
  outside_subnet_name     = var.outside_subnet_name
  diag_subnet_name        = var.diag_subnet_name
  mgmt_subnet_name        = var.mgmt_subnet_name

  outside_interface_sg    = var.outside_interface_sg
  inside_interface_sg     = var.inside_interface_sg
  mgmt_interface_sg       = var.mgmt_interface_sg
  fmc_mgmt_interface_sg   = var.fmc_mgmt_interface_sg
  create_fmc              = true
}

resource "tls_private_key" "key_pair" {
algorithm = "RSA"
rsa_bits  = 4096
}

resource "local_file" "private_key" {
content       = tls_private_key.key_pair.private_key_openssh
filename      = var.keyname
file_permission = 0700
}

resource "aws_key_pair" "deployer" {
  key_name   = var.keyname
  public_key = tls_private_key.key_pair.public_key_openssh
}