resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = var.rt_cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge(
    var.tags,
    {
      Name = "public_route_table"
    }
  )
}

resource "aws_route_table" "private_rtb" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = var.rt_cidr_block
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }
  tags = merge(
    var.tags,
    {
      Name = "private_route_table"
    }
  )
}