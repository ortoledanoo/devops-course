resource "aws_route_table" "ex10-public-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ex10-igw.id
  }

  tags = {
    Name = "ex10-public-route_table"
  }
}