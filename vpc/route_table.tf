# Route Table(s)
# Route the public subnet traffic through the IGW
resource "aws_route_table" "main" {
  count = length(var.public_subnet)
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${var.project}-final-rt"
  }
}
#############################################################
# Route table and subnet associations
resource "aws_route_table_association" "internet_access" {
  count = length(var.public_subnet)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.main[count.index].id
}





# Add route to route table
resource "aws_route" "main" {
  route_table_id         = aws_vpc.this.default_route_table_id
  nat_gateway_id         = aws_nat_gateway.main.id
  destination_cidr_block = "0.0.0.0/0"
}