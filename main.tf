terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}



#secret_key = "${var.secret_key}"

provider "aws" {
  #access_key = "<+secrets.getValue("awssecretkey")>"
  #secret_key = "<+secrets.getValue("awssecretkeytf")>"
  access_key = var.secret_key
  secret_key = var.access_key
  region = "us-east-1"
}
/*
resource "aws_dynamodb_table" "terraform_locks" {
  hash_key = "LockID"
  name = "terraform-test-locks"
  #billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
}
*/
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
/*
  server_side_encryption_configuration {
    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
        }
    }
  }

}

terraform {
  backend "s3" {
    bucket = "demo-tf-state-s3-bucket"
    key = "moe/s3/terraform.tfstate"
    region = "us-east-1"

    # DynamoDB table name
    dynamodb_table = "terraform-test-locks"
    encrypt = true
  }
}
*/
