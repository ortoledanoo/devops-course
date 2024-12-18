module "security_group" {
  source = "../../modules/security_group"
  # Allow Inboud From ->
  ingress_rules = [
    { port = 22, cidr = "213.57.121.34/32", description = "Allow SSH" },
    { port = 80, cidr = "0.0.0.0/0", description = "Allow HTTP" },
    { port = 443, cidr = "0.0.0.0/0", description = "Allow HTTPS" },
    { port = 5000, cidr = "0.0.0.0/0", description = "Allow Python-WeatherApp" }
  ]
}

module "ec2_instance" {
  source = "../../modules/ec2_instance"
  
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  security_group_ids = [module.security_group.security_group_id]
}

module "app_deployment" {
  source = "../../modules/app_deployment"
  
  instance_ip        = module.ec2_instance.public_ip
  playbook_path     = "../../modules/app_deployment/docker-weather-app-playbook.yml"
  ssh_user          = var.ssh_user
  depends_on        = [module.ec2_instance]
}