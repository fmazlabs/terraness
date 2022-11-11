variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

#terraform {
 # required_providers {
  #  aws = {
   #   source  = "hashicorp/aws"
    #  version = "~> 4.0"
   # }
  #}
#}



#secret_key = "${var.secret_key}"

provider "aws" {
  #access_key = "<+secrets.getValue("awssecretkey")>"
  #secret_key = "<+secrets.getValue("awssecretkeytf")>"
  access_key = "${var.secret_key}"
  secret_key = "${var.access_key}"
  region = "us-east-1"
}



resource "aws_s3_bucket" "terraform-state" {
  bucket = "demo-tf-state-s3-bucket"
  acl = "private"
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = true
  }
}

 
