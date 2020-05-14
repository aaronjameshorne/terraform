
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "ssh_connect"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_ami" "amz2_linux" {
  most_recent = true
  owners = ["self"]

}

resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = "${var.PATH_TO_PUBLIC_KEY}"
}

resource "aws_instance" "example" {
  ami                    = "${data.aws_ami.amz2_linux.id}"
  instance_type          = "${var.t2-micro-size}"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  key_name               = "${aws_key_pair.mykey.key_name}"

  tags = {
    datadog      = "yes"
    environment  = "dev"
    ansible      = "yes"

  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip}  > public_ips.txt"
  }
}
