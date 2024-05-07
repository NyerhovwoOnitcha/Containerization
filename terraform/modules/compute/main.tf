# create instance for jenkins

resource "aws_instance" "jenkins_server" {
  ami             = "ami-008c7f3666a08c8be"
  instance_type   = "t2.medium"
  key_name        = var.keypair

  tags = {
    Name = "jenkinsServer"
  }
}

