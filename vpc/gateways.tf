resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = merge(
    var.tags,
    {
      Name = "internet_gateway"
    }
  )
}
resource "aws_eip" "nat_gw_eip" {
  vpc = true
  tags = merge(
    var.tags,
    {
      Name = "elastic_ip"
    }
  )
}
resource "aws_nat_gateway" "nat_gw" {
  depends_on    = [aws_internet_gateway.igw]
  allocation_id = aws_eip.nat_gw_eip.id
  subnet_id     = aws_subnet.public_subnet[0].id
  tags = merge(
    var.tags,
    {
      Name = "nat_gateway"
    }
  )
}
