provider "aws" {
 region= "ap-south-1"
 access_key= "AKIAZSG7LV6DMHRUNQ5D"
 secret_key= "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"
}

resource "aws_instance" "myfirstec2" {
 ami= "ami-0e742cca61fb65051"
 instance_type= "t2.micro"
 user_data = <<-EOF
             #!/bin/bash
             sudo yum update
             sudo yum install nginx -y
             sudo systemctl start nginx
             sudo systemctl enable nginx
             EOF
 key_name = aws_key_pair.web.id
 vpc_security_group_ids = [ aws_security_group.ssh-access.id ]
}

resource "aws_key_pair" "web" {
  public_key = file("/root/.ssh/id_rsa.pub")
}

resource "aws_security_group" "ssh-access" {

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

output publicip {
  value = aws_instance.myfirstec2.public_ip
}

