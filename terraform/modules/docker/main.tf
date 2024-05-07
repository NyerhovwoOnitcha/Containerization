
terraform {

  required_providers {
    dockerhub = {
      source  = "BarnabyShearer/dockerhub"
      version = ">= 0.0.15"
    }
  }
}

provider "dockerhub" {
  # Note: This cannot be a Personal Access Token
  username = "warriconnected" 
  password = "Akpesiri10" 
}



resource "dockerhub_repository" "test_Repo" {
  name             = var.name
  namespace        = var.namespace
  description      = var.description
  full_description = "Readme."
}

