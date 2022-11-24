resource "aws_internet_gateway" "sample-internet-gw" {
  vpc_id = aws_vpc.sample_vpc.id
}
