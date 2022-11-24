resource "aws_route_table" "sample_public" {
  vpc_id = aws_vpc.sample_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sample-internet-gw.id
  }
}

# route associations
resource "aws_route_table_association" "sample_public_1" {
  subnet_id      = aws_subnet.sample_public_subnet_1.id
  route_table_id = aws_route_table.sample_public.id
}
