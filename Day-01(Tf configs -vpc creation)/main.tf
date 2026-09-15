# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "MyVPC"
  }
}

# Create S3 Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "ramesh-terraform-lab-bucket"  # must be globally unique

  tags = {
    Name = "MyBucket"
  }
}
