module "dev" {
  source = "../"

  aws_region    = "us-east-1"
  vpc_cidr      = "10.0.0.0/16"
  subnet_cidr_1 = "10.0.1.0/24"
  vpc_tag       = "Ramesh-vpc"
  subnet_tag_1  = "Ramesh-subnet-1"
}