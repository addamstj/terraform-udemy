resource "aws_security_group" "web_sg" {
  name = "web_sg"

  ingress {
    to_port     = 80
    from_port   = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    to_port     = 80
    from_port   = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    to_port     = 443
    from_port   = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    to_port     = 443
    from_port   = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
