provider "aws" {}

resource "aws_instance" "example" {
  ami           = "ami-657bd20a"
  instance_type = "t2.micro"
  tags {
     Name = "TerraformServer"
  }
}

