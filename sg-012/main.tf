variable "ingress_rules" {
  type = list(number)
  default = [80,443]
}

variable "egress_rules" {
  type = list(number)
  default = [80,443]
}

resource "aws_instance" "ec2" {
  ami             = "ami-0d8e27447ec2c8410"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.web_traffic.name]

  tags = {
    Name = "SG EC2"
  }
}

resource "aws_security_group" "web_traffic" {
  name = "Allow HTTPS"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_rules
    content {
    from_port   = port.value
    to_port     = port.value
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egress_rules
    content {
    from_port   = port.value
    to_port     = port.value
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

output "checklist" {
  value = [ for i  in var.ingress_rules : "Port ${i} expected to be open"]
}

output "expected" {
  value = aws_security_group.web_traffic[*].ingress
}