// AWS Environment -- Remove the # to before configure a value to it. 
// If you dont provide any value, it will take the default value 

############################################################
#AWS Creditials to access the AWS Cloud
#############################################################
aws_access_key = ""
aws_secret_key = ""
region = "ap-south-1"

############################################################
#Define New VPC in a specific Region and Avilability Zone 
#############################################################
vpc_name = "pod-20"
vpc_cidr = "10.20.0.0/16"
create_igw = true
# Generate the key if you want to login thru the  key
keyname = "ln-20"
instances_per_az        = 1
availability_zone_count = 2

##################################################################################
#Define CIDR, Subnets for managment and three for Inside, Outisde and Diag
###################################################################################

mgmt_subnet_cidr = ["10.20.1.0/24","10.20.10.0/24"]
outside_subnet_cidr = ["10.20.2.0/24","10.20.20.0/24"]
inside_subnet_cidr = ["10.20.3.0/24","10.20.30.0/24"]
diag_subnet_cidr = ["10.20.4.0/24","10.20.40.0/24"]
app_subnet_cidr = ["10.20.5.0/24","10.20.50.0/24"]
bastion_subnet_cidr = "10.20.6.0/24"

ftd_mgmt_ip = ["10.20.1.10","10.20.10.10"]
ftd_outside_ip = ["10.20.2.10","10.20.20.10"]
ftd_inside_ip = ["10.20.3.10","10.20.30.10"]
ftd_diag_ip = ["10.20.4.10","10.20.40.10"]
ftd_app_ip = ["10.20.5.10","10.20.50.10"]
bastion_ip = "10.20.6.10"
fmc_ip = "10.20.1.57"

inside_subnet_name = ["inside120","inside220"]
outside_subnet_name = ["outside120","outside220"]
mgmt_subnet_name = ["mgmt120","mgmt220"]
diag_subnet_name = ["diag120","diag220"]
app_subnet_name = ["app120","app220"]
bastion_subnet_name = "bastion20"

create = "external"

outside_interface_sg = [
    {
        from_port = 80
        protocol = "TCP"
        to_port = 80
        cidr_blocks = ["10.20.2.0/24","10.20.20.0/24"]
        description = "Outside Interface SG-80"
    },
    {
        from_port = 22
        protocol = "TCP"
        to_port = 22
        cidr_blocks = ["10.20.2.0/24","10.20.20.0/24"]
        description = "Outside Interface SG-22"
    }
]

inside_interface_sg = [
    {
        from_port = 80
        protocol = "TCP"
        to_port = 80
        cidr_blocks = ["10.20.5.0/24","10.20.50.0/24"]
        description = "Inside Interface SG-80"
    }
]

mgmt_interface_sg = [
    {
        from_port = 8305
        protocol = "TCP"
        to_port = 8305
        cidr_blocks = ["10.20.1.0/24"]
        description = "Mgmt Interface SG"
    }
]

fmc_mgmt_interface_sg = [
    {
        from_port = 443
        protocol = "TCP"
        to_port = 443
        cidr_blocks = ["0.0.0.0/0"]
        description = "fmcmgmt Interface SG-443"
    },
    {
        from_port = 8305
        protocol = "TCP"
        to_port = 8305
        cidr_blocks = ["10.20.1.0/24","10.20.10.0/24"]
        description = "fmcmgmt Interface SG-8305"
    }
]

bastion_interface_sg = [
    {
        from_port = 80
        protocol = "TCP"
        to_port = 80
        cidr_blocks = ["10.20.5.0/24","10.20.50.0/24"]
    },
    {
        from_port = 22
        protocol = "TCP"
        to_port = 22
        cidr_blocks = ["10.20.5.0/24","10.20.50.0/24"]
    },
    {
        from_port = 0
        protocol = -1
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }
]

app_interface_sg = [
    {
        from_port = 80
        protocol = "TCP"
        to_port = 80
        cidr_blocks = ["10.20.5.0/24","10.20.50.0/24"]
    },
    {
        from_port = 22
        protocol = "TCP"
        to_port = 22
        cidr_blocks = ["10.20.5.0/24","10.20.50.0/24"]
    },
    {
        from_port = 0
        protocol = -1
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }
]

app_lb_name = "APP-LB-Pod20"

app_lb_ip1 = "10.20.5.100"

app_lb_ip2 = "10.20.50.100"

elb_name = "External-LB-pod20"

ilb_name = "Internal-LB-pod20"

pod_no = "20" 