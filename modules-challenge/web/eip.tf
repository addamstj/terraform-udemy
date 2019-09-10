resource "aws_eip" "web_ip" {
  instance = "${aws_instance.web.id}"
}

output "Web Public IP" {
  value = "${aws_eip.web_ip.public_ip}"
}
