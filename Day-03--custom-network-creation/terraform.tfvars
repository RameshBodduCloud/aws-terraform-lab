region = "us-west-2"
vpc_name = "Ramesh-Vpc-1"
vpc_cidr = "10.0.0.0/16"
public_subnet_name = "Ramesh-Public-Subnet-1"
public_subnet_cidr = "10.0.0.0/24"
private_subnet_name = "Ramesh-private-Subnet-1"
private_subnet_cidr = "10.0.1.0/24"
internet_gateway_name = "Ramesh-Igw"
public_route_table_name = "Ramesh-PS-RT"
private_route_table_name = "Ramesh-Private-RT"
route_table_cidr = "0.0.0.0/0"
security_group_name = "Ramesh-SG"
security_group_description = "Allow SSH and HTTP inbound traffic"
sg_cidr = "0.0.0.0/0"
key_pair_name = "Ramesh-Key-Pair"
public_key_path = "id_rsa.pub"
ami_id = "ami-0413c9aa513b49c44"
instance_type = "t3.micro"
bastion_host_name = "Bastion-Host"
private_instance_name = "Ramesh-Private-Instance"
nat_gateway_name = "Ramesh-Nat-Gateway"

vpc_tags = {
  Name = "Ramesh-Vpc-1"
}

public_subnet_tags = {
  Name = "Ramesh-Public-Subnet-1"
}

private_subnet_tags = {
  Name = "Ramesh-private-Subnet-1"
}

nat_gateway_tags = {
  Name = "Ramesh-Nat-Gateway"
}

route_table_tags = {
  Name = "Ramesh-Private-RT"
}

bastion_host_tags = {
  Name = "Bastion-Host"
}

private_instance_tags = {
  Name = "Ramesh-Private-Instance"
}

security_group_tags = {
  Name = "Ramesh-SG"
}

key_pair_tags = {
  Name = "Ramesh-Key-Pair"
}