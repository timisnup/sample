resource "aws_vpc" "sample-vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "sample-vpc"
  }
}



#Public subnet 1
resource "aws_subnet" "public-sub-1" {
  vpc_id            = aws_vpc.sample-vpc.id
  cidr_block        = var.pub1_cidr
  availability_zone = var.sub_ava1


  tags = {
    Name = "public-sub-1"
  }
}



#public subnet 2
resource "aws_subnet" "public-sub-2" {
  vpc_id            = aws_vpc.sample-vpc.id
  cidr_block        = var.pub2_cidr
  availability_zone = var.sub_ava2

  tags = {
    Name = "public-sub-2"
  }
}


#Private subnet 1
resource "aws_subnet" "private-sub-1" {
  vpc_id            = aws_vpc.sample-vpc.id
  cidr_block        = var.pri1_cidr
  availability_zone = var.sub_ava1

  tags = {
    Name = "private-sub-1"
  }
}


#Private subnet 2
resource "aws_subnet" "private-sub-2" {
  vpc_id            = aws_vpc.sample-vpc.id
  cidr_block        = var.pri2_cidr
  availability_zone = var.sub_ava2

  tags = {
    Name = "private-sub-2"
  }
}


#Public route table
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.sample-vpc.id

  tags = {
    Name = "public-rt"
  }
}


#Private route table
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.sample-vpc.id

  tags = {
    Name = "private-rt"
  }
}


#Public route table association
resource "aws_route_table_association" "public-sub-1-association" {
  subnet_id      = aws_subnet.public-sub-1.id
  route_table_id = aws_route_table.public-rt.id
}


#pubic route table association
resource "aws_route_table_association" "public-sub-2-association" {
  subnet_id      = aws_subnet.public-sub-2.id
  route_table_id = aws_route_table.public-rt.id
}


#private route table association
resource "aws_route_table_association" "private-sub-1-association" {
  subnet_id      = aws_subnet.private-sub-1.id
  route_table_id = aws_route_table.private-rt.id
}


#private route table association
resource "aws_route_table_association" "private-sub-2-association" {
  subnet_id      = aws_subnet.private-sub-2.id
  route_table_id = aws_route_table.private-rt.id
}


#Internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.sample-vpc.id

  tags = {
    Name = "igw"
  }
}


#aws route
resource "aws_route" "public-IGW-route" {
  route_table_id         = aws_route_table.public-rt.id
  destination_cidr_block = var.pub_route_cidr
  gateway_id             = aws_internet_gateway.igw.id

}
