
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "ssh_connect"
  

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["73.139.34.225/32"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["45.73.149.202/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = "${var.PATH_TO_PUBLIC_KEY}"
}

resource "aws_instance" "example" {
  ami           = "${var.AMIS}"
  instance_type = "${var.t2-micro-size}"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  key_name = "${aws_key_pair.mykey.key_name}"
  user_data = <<EOF
#!/bin/bash
DD_AGENT_MAJOR_VERSION=7 DD_API_KEY=8b47966137e9f64b6005e591020698e8 bash -c "$(curl -L https://raw.githubusercontent.com/DataDog/datadog-agent/master/cmd/agent/install_script.sh)"
sudo yum -y update
sudo yum install -y htop
sudo yum install -y vim
echo -e 'FreeB$D3\FreeB$D3\n' | sudo passwd ec2-user
sudo yum install -y git
sudo yum install -y sshpass
yum -y install python-pip
sudo amazon-linux-extras install -y epel
sudo yum install -y ansible
sudo yum install -y python34 python-pip
sudo pip install -U pip
sudo pip install -U virtualenv
cd /home/ec2-user/
git clone https://github.com/aaronjameshorne/python.git
git clone https://github.com/aaronjameshorne/terraform.git
sudo yum install epel-release
sudo yum -y update
curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash
EOF

  tags = {
    datadog = "yes"
    environment = "dev"
    ansible = "yes"

  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} >> public_ips.txt"
  }
}

output "ip" {
  value = aws_instance.example.public_ip
}
