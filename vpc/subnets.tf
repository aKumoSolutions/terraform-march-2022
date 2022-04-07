resource "aws_subnet" "public_subnet" {
  count             = length(var.subnet_azs)
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = element(var.pub_cidr_subnet, count.index)
  availability_zone = element(var.subnet_azs, count.index)
}

resource "aws_subnet" "private_subnet" {
  count             = length(var.subnet_azs)
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = element(var.priv_cidr_subnet, count.index)
  availability_zone = element(var.subnet_azs, count.index)
}

resource "aws_route_table_association" "public" {
  count = length(var.subnet_azs)

  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.public_rtb.*.id, count.index)
}

resource "aws_route_table_association" "private" {
  count = length(var.subnet_azs)

  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.private_rtb.*.id, count.index)
}