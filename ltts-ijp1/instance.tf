resource "aws_instance" "instance-terraform" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  vpc_id = "${aws_vpc.ltts-ijp.id}"
  subnet_id = "${aws_subnet.ltts-ijp-gateway.*.id[count.index]}"
  associate_public_ip_address = true

  tags {
      Name = "dev-instance-terraform"
  }

}
resource "aws_instance" "instance-java" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  vpc_id = "${aws_vpc.ltts-ijp.id}"
  subnet_id = "${aws_subnet.ltts-ijp-gateway.*.id[count.index]}"
  associate_public_ip_address = true

  tags {
      Name = "dev-instance-java"
  }
}
resource "aws_eip" "instance-terraform" {
  count = "${var.subnet_count}"
  vpc      = true
}

resource "aws_eip" "instance-java" {
  count = "${var.subnet_count}"
  vpc      = true
}
