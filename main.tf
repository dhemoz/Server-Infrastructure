provider "aws" {
  access_key = "ACCESS_KEY"
  secret_key = "SECRET_KEY"
  region     = "us-east-1"
}

module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = ""
  instance_count         = 1

  ami                    = ""
  instance_type          = "t2.micro"
  key_name               = ""
  monitoring             = true
  vpc_security_group_ids = [""]
  subnet_id              = ""
  user_data		 = "${file("script.sh")}"
  tags = {
    Terraform   = "true"
    Environment = "prod"
    Name	= "Rizki-Wijaya"
  }
}