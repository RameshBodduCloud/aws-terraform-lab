module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = "10.0.0.0/16"
}

module "subnets" {
    source = "./modules/subnets"
    vpc_id      = module.vpc.vpc_id
    subnet_cidr = "10.0.1.0/24"
    availability_zone = "us-east-1a"
}

module "security_groups" {
  source        = "./modules/security_groups"
  sg_name       = "app-sg"
  sg_description= "App security group"
  vpc_id        = module.vpc.vpc_id
}

module "ec2" {
  source        = "./modules/ec2"
  ami_id        = "ami-0b245cc5f82576748" # Example AMI ID
  instance_type = "t3.micro"
  subnet_id     = module.subnets.subnet_id
  sg_id         = module.security_groups.sg_id
  instance_name = "MyAppInstance"
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/index.js"
  output_path = "${path.module}/lambda.zip"
}

module "lambda" {
  source           = "./modules/lambda"
  function_name    = "MyLambdaFunction"
  handler          = "index.handler"
  runtime          = "nodejs18.x"
  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
}

module "github_repo" {
  source = "git::https://github.com/RameshBodduCloud/aws-terraform-lab.git//Day-06--Modules-Intro?ref=main"
  vpc_cidr      = "10.0.0.0/16"
  subnet_cidr_1 = "10.0.1.0/24"
  vpc_tag       = "Ramesh-vpc-git"
  subnet_tag_1  = "Ramesh-subnet"
}


#Terraform managed module for S3 bucket creation
module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "my-s3-bucket-ramesh1"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}
