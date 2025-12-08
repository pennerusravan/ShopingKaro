terraform {
  backend "s3" {
    bucket       = "iac-state-bucket"
    key          = "terraform.tfstate"
    region       = "eu-west-3"
    use_lockfile = true
  }
}