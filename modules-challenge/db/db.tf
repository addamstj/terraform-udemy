resource "aws_instance" "db" {
  ami           = "ami-0d8e27447ec2c8410"
  instance_type = "t2.micro"

  tags = {
    Name = "DB"
  }
}

output "DB Private IP" {
  value = "${aws_instance.db.private_ip}"
}
