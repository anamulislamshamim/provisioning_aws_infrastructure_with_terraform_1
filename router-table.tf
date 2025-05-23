resource "aws_route_table" "shamim_tf_public_route_table" {
  vpc_id = aws_vpc.vpc-shamim-tf-ap-south-1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public_internet_gateway.id
  }
  tags = {
    Name = "RT Public: For Shamim AP South 1"
  }
}

resource "aws_route_table" "shamim_tf_private_route_table" {
  count      = length(var.cidr_private_subnet)
  vpc_id     = aws_vpc.vpc-shamim-tf-ap-south-1.id
  depends_on = [aws_nat_gateway.nat_gateway]
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway[count.index].id
  }
  tags = {
    Name = "RT Private: For Shamim AP South 1"
  }
}
