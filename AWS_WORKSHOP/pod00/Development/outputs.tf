output vpc_id {
    value = module.network.vpc_id
}

output ftd {
    value = module.instance.instance_private_ip
}

output fmc {
    value = module.instance.fmc_instance_private_ip
}


