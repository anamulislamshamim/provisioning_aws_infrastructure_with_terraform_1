resource "aws_eip" "nat_eip" {
  count = length(var.cidr_private_subnet)
  vpc   = true
}

resource "aws_nat_gateway" "nat_gateway" {
  count         = length(var.cidr_private_subnet)
  depends_on    = [aws_eip.nat_eip]
  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id     = aws_subnet.aws_shamim_tf_private_subnets[count.index].id

  tags = {
    Name = "Private NAT GW: For Shamim AP South 1 project"
  }
}
