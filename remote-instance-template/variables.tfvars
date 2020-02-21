PATH_TO_PUBLIC_KEY = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDRHd3bAnZngSFyl2+L7fzlYq7NS3IboQ+yNIQutn+WhHj/87xb6y2KbTNA5eMLBiGq4tzirerl/BxU3FS6ZAtwlbTr0XYN9bZP+wxgNLguED/gjEFEr0kEpbGh3SF80z+NyX7jZXF/ilDf7vd2G+6z4/2o1NhxdXLpIcDbwpo6eaD5BkIacsIRy4qcoy8vPzHpzmJ+6oeSPWFE04R6kq2nc8FYLKrk1VgT+1u9drmuO20bm5DuXzQGNIliwYcHDWFr0VY4XDEpBZ0RnCQwXaYwZNzV/JnBDOrgqiEPi4/t+69KoO8RdZeagrkdtE5whq7zVMg9Gbemh4S17JYh2rOf ahorne@FLL1006927L"
t2-micro-size = "t2.micro"
package_install = <<EOF
#!/bin/bash
sudo yum -y update
sudo yum install -y htop
sudo yum install -y vim
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
sudo yum install -y python34 python34-pip
EOF

