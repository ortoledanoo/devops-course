resource "aws_route_table_association" "connect-subnet-routetable" {
  subnet_id      = aws_subnet.ex-10-public-subnet.id
  route_table_id = aws_route_table.ex10-public-rt.id
}