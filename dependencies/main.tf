resource "aws_instance" "web" {
  ami           = "ami-0d8e27447ec2c8410"
  instance_type = "t2.micro"

  tags = {
    Name = "Web Server"
  }

  depends_on = ["aws_instance.db"]
}

resource "aws_instance" "db" {
  ami           = "ami-0d8e27447ec2c8410"
  instance_type = "t2.micro"

  tags = {
    Name = "DB Server"
  }
}
