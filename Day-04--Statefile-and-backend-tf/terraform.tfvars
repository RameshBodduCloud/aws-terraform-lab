aws_region        = "us-east-1"
vpc_cidr_block    = "10.0.0.0/16"
subnet_cidr_block = "10.0.1.0/24"
instance_ami      = "ami-0bd3fbcdc633a1b1a"
instance_type     = "t3.micro"
vpc_tags = {
  Name = "Ramesh-Vpc"
}
subnet_tags = {
  Name = "Ramesh-Subnet"
}
security_group_tags = {
  Name = "Ramesh-SG"
}
instance_tags_1 = {
  "Name" = "Ramesh-Instance-1"
}
instance_tags_2 = {
  "Name" = "Ramesh-Instance-2"
}
