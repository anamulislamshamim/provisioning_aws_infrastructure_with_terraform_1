data "aws_subnet" "public_subnet" {
  filter {
    name   = "tag:Name"
    values = ["Subnet-Public : Public Subnet 1"]
  }

  depends_on = [
    aws_route_table_association.public_subnet_asso
  ]
}

resource "aws_instance" "ec2_example_tf" {
  ami           = "ami-0e35ddab05955cf57"
  instance_type = "t2.micro"
  tags = {
    Name = "EC2 Public Subnet 1"
  }
  key_name               = "aws_key_tf"
  subnet_id              = data.aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg_vpc_shamim_tf_ap_south_1.id]
}

resource "aws_key_pair" "deployer" {
  key_name   = "aws_key_tf"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whE"
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.ec2_example_tf.id
}


output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ec2_example_tf.public_ip
}
