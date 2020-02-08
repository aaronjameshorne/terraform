resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = "${var.PATH_TO_PUBLIC_KEY}"
}

resource "aws_instance" "example" {
  ami           = "${var.AMIS}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.mykey.key_name}"
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.private_ip} >> private_ip.txt"
  }
}
output "ip" {
  value = "${aws_instance.example.public_ip}"
}
