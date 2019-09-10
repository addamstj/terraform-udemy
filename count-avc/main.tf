module "instances" {
  source  = "./ec2"
  servers = ["web", "db", "app"]
}

output "Public IPs" {
  value = "${module.instances.public_ip}"
}
