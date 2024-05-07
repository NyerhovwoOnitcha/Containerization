packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}


source "amazon-ebs" "jenkins_ubuntu_ami" {
  ami_name      = "jenkins-ami-aws-${local.timestamp}"
  instance_type = "t2.medium"
  region        = "us-east-2"
  source_ami    = "ami-0f30a9c3a48f3fa79"
  # source_ami_filter {
  #   filters = {
  #     name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
  #     root-device-type    = "ebs"
  #     virtualization-type = "hvm"
  #   }
  #   most_recent = true
  #   owners      = ["673622277663"] 
  # }
  ssh_username = "ubuntu"
}

build {
  name = "jenkins-ami-build"
  sources = [
    "source.amazon-ebs.jenkins_ubuntu_ami"
  ]

  provisioner "shell" {
    script = "jenkins.sh"
  }
}
