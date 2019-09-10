module "dbserver" {
  source = "./db"
}

module "webserver" {
  source = "./web"
}
