resource "aws_internet_gateway" "ex10-igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "ex10-IGW"
  }
}