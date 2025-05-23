resource "aws_internet_gateway" "public_internet_gateway" {
  vpc_id = aws_vpc.vpc-shamim-tf-ap-south-1.id
  tags = {
    Name = "IGW: For Shamim AP South 1 project"
  }
}
