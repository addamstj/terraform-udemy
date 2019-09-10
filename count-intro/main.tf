resource "aws_instance" "ec2" {
  ami           = "ami-0d8e27447ec2c8410"
  instance_type = "t2.micro"

  count = 3
}
