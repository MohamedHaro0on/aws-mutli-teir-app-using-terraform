terraform {
    backend "s3" {
      bucket = "mohamed-haroon-3-tier-architecture-terraform"
      key = "terraform.tfstate"
      region = "us-east-1"
      lock_state = true
    }
}