terraform {
  required_version = ">= 0.11.12"

  backend "s3" {
    role_arn = "arn:aws:iam::269807742353:role/developer"

    bucket         = "wellcomecollection-reporting-infra"
    key            = "terraform/reporting.tfstate"
    dynamodb_table = "terraform-locktable"
    region         = "eu-west-1"
  }
}

data "terraform_remote_state" "shared_infra" {
  backend = "s3"

  config {
    role_arn = "arn:aws:iam::760097843905:role/developer"

    bucket = "wellcomecollection-platform-infra"
    key    = "terraform/shared_infra.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "infra_critical" {
  backend = "s3"

  config {
    role_arn = "arn:aws:iam::760097843905:role/developer"

    bucket = "wellcomecollection-platform-infra"
    key    = "terraform/catalogue_pipeline_data.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "sierra_adapter" {
  backend = "s3"

  config {
    role_arn = "arn:aws:iam::760097843905:role/developer"

    bucket = "wellcomecollection-platform-infra"
    key    = "terraform/sierra_adapter.tfstate"
    region = "eu-west-1"
  }
}

resource "aws_s3_bucket" "reporting_lambdas" {
  bucket = "wellcomecollection-reporting-lambdas"
  acl    = "private"
}
