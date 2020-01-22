resource "aws_instance" "example" {
  ami = "${var.AMIS}"
  instance_type = "t2.micro"
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.private_ip} >> private_ip.txt"
  }
}
output "ip" {
  value = "${aws_instance.example.public_ip}"
}

