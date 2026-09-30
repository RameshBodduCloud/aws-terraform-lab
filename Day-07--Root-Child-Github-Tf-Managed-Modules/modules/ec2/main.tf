resource "aws_instance" "Ramesh-ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_groups = [var.sg_id]

  tags = {
    Name = var.instance_name
  }

    lifecycle {
    ignore_changes = [
      security_groups,
      ami,
      instance_type,
      subnet_id,
    ]

}
}