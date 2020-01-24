variable "vpcname" {
  type    = "string"
  default = "VPCTerraform"
}

variable "mylist" {
  type    = "list"
  default = ["Value1", "Value2"]
}

variable "mymap" {
  type = "map"

  default = {
    Key1 = "Value 1"
    Key2 = "Value 2"
  }
}

variable "myboolean" {
  default = true
}

resource "aws_vpc" "myvpc" {
  cidr_block = "192.168.0.0/24"

  tags = {
    Name = "${var.mymap["Key1"]}"
  }
}
