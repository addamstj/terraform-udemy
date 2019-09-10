variable "servers" {
  type = "list"
}

resource "aws_instance" "ec2" {
  ami                         = "ami-0d8e27447ec2c8410"
  instance_type               = "t2.micro"
  count                       = "${length(var.servers)}"
  associate_public_ip_address = true

  tags = {
    Name = "${var.servers[count.index]}"
  }
}

output "public_ip" {
  value = ["${aws_instance.ec2.*.public_ip}"]
}
