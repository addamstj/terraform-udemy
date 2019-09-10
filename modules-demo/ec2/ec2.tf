variable "ec2name" {
  type = "string"
}

resource "aws_instance" "moduleEC2" {
  ami           = "ami-0d8e27447ec2c8410"
  instance_type = "t2.micro"

  tags = {
    Name = "${var.ec2name}"
  }
}
