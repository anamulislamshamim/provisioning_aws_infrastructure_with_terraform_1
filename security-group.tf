resource "aws_security_group" "sg_vpc_shamim_tf_ap_south_1" {
  egress = [
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "This is testing terraform security group by Shamim"
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]

  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = "Incoming request"
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    }
  ]
  vpc_id     = aws_vpc.vpc-shamim-tf-ap-south-1.id
  depends_on = [aws_vpc.vpc-shamim-tf-ap-south-1]
  tags = {
    Name = "SG: vpc-shamim-ap-south-1"
  }
}
