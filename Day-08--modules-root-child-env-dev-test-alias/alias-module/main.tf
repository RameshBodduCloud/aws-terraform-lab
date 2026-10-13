provider "aws" {
  region  = "us-west-2"
  profile = "dev_profile"
}

# VPC in Dev account (oregon)
resource "aws_vpc" "dev_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "dev-vpc-oregon"
  }
}

provider "aws" {
  alias   = "test"
  profile = "dev_profile"
  region  = "us-east-1"
}

# VPC in Test account (Virginia)
resource "aws_vpc" "test_vpc" {
  provider   = aws.test
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "test-vpc-virginia"
  }
}
