variable "ingress_rules" {
  type = list(number)
  default = [80,443,25,3306,3389,8080]
}

variable "egress_rules" {
  type = list(number)
  default = [443,8443]
}


resource "aws_instance" "ec2" {
  ami           = "ami-0d8e27447ec2c8410"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.webserver.name]
}

resource "aws_security_group" "webserver" {
  name = "Web Ports"

  dynamic "ingress" {
      iterator = port
      for_each = var.ingress_rules
      content {
          from_port = port.value
          to_port = port.value
          protocol = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
      }
  }

  dynamic "egress" {
      iterator = port
      for_each = var.egress_rules
      content {
          from_port = port.value
          to_port = port.value
          protocol = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
      }
  }
}

resource "aws_eip" "elastic_ip" {
    instance = aws_instance.ec2.id
}

output "Public_IP" {
    value = aws_eip.elastic_ip.public_ip
}

output "expectedIngress" {
    value = [for i in var.ingress_rules : "Port ${i} expected to be open"]
}

output "expectedEgress" {
    value = [for i in var.egress_rules : "Port ${i} expected to be open"]
}

output "actualI" {
    value = aws_security_group.webserver[*].ingress
}

output "actualE" {
    value = aws_security_group.webserver[*].egress
}