module "network" {
  source                  = "modules/network"
  vpc_cidr                = "${var.vpc_cidr}"
  private_subnet_cidr-az1 = "${var.private_subnet_cidr-az1}"
  private_subnet_name-az1 = "${var.private_subnet_name-az1}"
  public_subnet_cidr-az1  = "${var.public_subnet_cidr-az1}"
  public_subnet_name-az1  = "${var.public_subnet_name-az1}"
  public_subnet_cidr-az2  = "${var.public_subnet_cidr-az2}"
  public_subnet_name-az2  = "${var.public_subnet_name-az2}"
  private_subnet_cidr-az2 = "${var.private_subnet_cidr-az2}"
  private_subnet_name-az2 = "${var.private_subnet_name-az2}"
  region                  = "${var.region}"
  az1                     = "${var.region-az1}"
  az2                     = "${var.region-az2}"
  env                     = "${var.env}"
  id                      = "${var.id}"
}

module "compute" {
  source                   = "/modules/compute"
  region                   = "${var.region}"
  env                      = "${var.env}"
  id                       = "${var.id}"
  az1                      = "${var.region-az1}"
  az2                      = "${var.region-az2}"
  region-key               = "${var.region-key}"
  private-subnet1-id       = "${module.network.private-subnet1-id}"
  private-subnet2-id       = "${module.network.private-subnet2-id}"
  public-subnet1-id        = "${module.network.public-subnet1-id}"
  public-subnet2-id        = "${module.network.public-subnet2-id}"
  ebs-size                 = "${var.ebs-size}"
  app-instance-count       = "${var.app-instance-count}"
  petclinic-app-sg         = "${module.network.petclinic-app-sg}"
  petclinic-bastion-sg     = "${module.network.petclinic-bastion-sg}"
  petclinic-buildserver-sg = "${module.network.petclinic-buildserver-sg}"
  app-instance-type        = "${var.app-instance-type}"
}
