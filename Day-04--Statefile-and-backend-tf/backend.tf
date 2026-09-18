terraform {
  backend "s3" {
    bucket         = "ramesh-terraform-state-bucket1"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    #dynamodb_table = "Ramesh-state-lock"
    use_lockfile = true
    #encrypt        = true 
  }
}