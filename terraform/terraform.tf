terraform {
  required_version = ">= 0.11.12"

  backend "s3" {
    role_arn = "arn:aws:iam::269807742353:role/reporting-developer"

    bucket         = "wellcomecollection-reporting-infra"
    key            = "terraform/reporting.tfstate"
    dynamodb_table = "terraform-locktable"
    region         = "eu-west-1"
  }
}

data "terraform_remote_state" "shared_infra" {
  backend = "s3"

  config = {
    role_arn = "arn:aws:iam::760097843905:role/platform-read_only"

    bucket = "wellcomecollection-platform-infra"
    key    = "terraform/platform-infrastructure/shared.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "infra_critical" {
  backend = "s3"

  config = {
    role_arn = "arn:aws:iam::760097843905:role/platform-read_only"

    bucket = "wellcomecollection-platform-infra"
    key    = "terraform/catalogue/infrastructure/critical.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "sierra_adapter" {
  backend = "s3"

  config = {
    role_arn = "arn:aws:iam::760097843905:role/platform-read_only"

    bucket = "wellcomecollection-platform-infra"
    key    = "terraform/sierra_adapter.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "calm_adapter" {
  backend = "s3"

  config = {
    role_arn = "arn:aws:iam::760097843905:role/platform-read_only"

    bucket = "wellcomecollection-platform-infra"
    key    = "terraform/calm_adapter.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "reindexer" {
  backend = "s3"

  config = {
    role_arn = "arn:aws:iam::760097843905:role/platform-developer"

    bucket = "wellcomecollection-platform-infra"
    key    = "terraform/catalogue/reindexer.tfstate"
    region = "eu-west-1"
  }
}
