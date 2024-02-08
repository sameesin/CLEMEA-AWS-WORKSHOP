# CLEMEA-AWS-WORKSHOP

## Learning Objectives
Upon completion of this lab, you will be able to: 
•	Get a basic understanding of Infrastructure as Code 
•	How to use Terraform to automate deployment of resources in AWS Cloud
•	How to use automation to deploy resources in Cisco Secure Firewall


## Disclaimer
This training document is to familiarize you with the configuration of Cisco Secure Firewall in AWS Cloud. Although the lab design and configuration examples could be used as a reference, it’s not a real design, thus not all recommended features are used, or enabled optimally. For design-related questions please contact your representative at Cisco or a Cisco partner. 

## Scenario 
In this lab, users will programmatically deploy Cisco Secure Firewall Threat Defence (FTD) and Firewall Management Center (FMC) using Infrastructure as Code (Terraform). The firewalls will be placed behind a network load balancer. The user will also programmatically configure the firewalls once onboarded to ensure it allows required traffic flow from the internet to the test machine setup in the AWS environment.

## Prerequisites:

1.	You should have your AWS accounts with the necessary permissions
2.	Install Terraform
3.	Install AWS CLI
4.	Install VSCODE
5.	Install GIT

## Task 1: Clone the git code 

To clone the code to your local machine move into your working directory and run the following command

`git clone https://github.com/sameesin/CLEMEA-AWS-WORKSHOP.git`


## Task 2. Deploy AWS Network Infrastructure

1.	Navigate to the AWS_Workshop_Code folder and move to the Development folder
2.	Most of the values in the terraform.tf file are added already and need no change
3.	Run command terraform init
4.	Run command terraform plan –out awslab
5.	Run command terraform apply awslab
6.	Verify the resources are created by the script as expected on the terminal.
On AWS console it will look like this.

## Task 3: Deploy the Application

1.	Move the following files from the resources folder to the Development folder

Apache_install.tpl
Apps.tf

2.	Run the commands terraform plan –out awslab
3.	Run the command terraform apply awslab
4.	verify that the Ubuntu applications are created on the terminal

## Task 4: FMC Configuration

### Prerequisites:
1.	To find the private IP of the external load balancer run the following command on the terminal
`aws elbv2 describe-load-balancers --names External-LB-pod<number>`
obtain the ELB id (e.g - net/test/a43050c9db0117) and use it in the next command.
2.	Run the command 
`aws ec2 describe-network-interfaces --filters Name=description,Values="ELB <ELB ID>" --query 'NetworkInterfaces[*].PrivateIpAddresses[*].PrivateIpAddress'`
where <ELB ID> will be replaced with the elb id obtained in the previous step.
3.	Open the terraform.tfvars file in the Resources folder and update the elb variable with the IPs obtained in the previous step output
4.	Obtain the private IP address of the FMC and add it to the variable fmc_ip
5.	Obtain the public IP address of the FMC and add it to the variable fmc_host
6.	management IPs of both the FTDs and update the variable ftd_mgmt_ip

### Note: Wait until the FMC is up and running before starting these steps
1.	Log into the FMC UI and select the evaluation period license
      
Figure 9: FMC Evaluation License
2.	While in the Resources folder terminal run the following commands
Terraform init
Terraform plan –out fmc
Terraform apply fmc
3.	Log into the FMC UI and verify that all the configuration is present as expected
4.	While in FMC UI, navigate to the Devices > platform settings and add a new threat defence policy
4.1.	Provide a name to the policy and add both FTD devices to the policy
4.2.	Click on save
4.3.	Select SSH Access from the list of options
4.4.	Click on Add
4.5.	Under IP address select any-ipv4
4.6.	For zones, select outside
4.7.	Click on ok
4.8.	Click on Save

5.	Click on Deploy and select both the FTD devices and deploy the changes

## Task 6: Tearing Down
To destroy all the resources that you created, Follow below steps. 
1.	Navigate to Development folder on terminal and run the following command
`Terraform destroy`
When prompted, type yes

## Summary
With the completion of this lab, you will know how to use Terraform to automate the deployment of resources in AWS to facilitate the deployment of Cisco Secure Firewall in AWS and configure the firewall for required inspection.
