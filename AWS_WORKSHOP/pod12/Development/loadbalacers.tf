module "load_balancer" {
  source                  = "../module/LoadBalancer/"
  vpc_id                  = module.network.vpc_id
  ftd_outside_ip          = module.network.outside_interface_ip
  outside_subnet_id       = module.network.outside_subnet #toset(module.network.outside_subnet)
  external_listener_ports = var.external_listener_ports
  create                  = var.create
  external_health_check   = var.external_health_check
  ilb_name                = var.ilb_name
  elb_name                = var.elb_name
  pod_no                  = var.pod_no
}