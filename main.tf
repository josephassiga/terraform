provider "aws" {}


resource "aws_instance" "example" {
  ami           = "ami-1e339e71"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]

  user_data     = <<-EOF
                  #!/bin/bash
		  echo "Hello,World" > index.html
		  nohup busybox httpd -f -p "${var.server_port}" &
                  EOF
  tags {
     Name = "TerraformServer"
  }
}

resource "aws_security_group" "instance" {
     name = "terraform-example-instance"

     ingress {
        from_port = "${var.server_port}"
        to_port   = "${var.server_port}"
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
     }

}


/*
resource "aws_cognito_identity_pool"  "cognito_pool_user"{
  identity_pool_name               = "CognitoPoolAgain"
  allow_unauthenticated_identities = false
  developer_provider_name          = "CognitoPoolAgain"
}
*/

