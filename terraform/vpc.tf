resource "aws_vpc" "my_vpc" {
    cidr_block = var.vpc_cidr_block
    tags = {
        Name = var.vpc_name
    }
}

resource "aws_subnet" "public_subnet" {
    count = length(var.public_subnet_cidr)
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = element(var.public_subnet_cidr, count.index)
    availability_zone = element(var.AZs, count.index)

    tags = {
        Name = "public subnet ${count.index + 1}"
    }
}

resource "aws_subnet" "private_subnet" {
    count = length(var.private_subnet_cidr)
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = element(var.private_subnet_cidr, count.index)
    availability_zone = element(var.AZs, count.index)

    tags = {
        Name = "private subnet ${count.index + 1}"
    }
}

resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.my_vpc.id

    tags = {
        Name = "MLflow VPC IGW"
    }
}

resource "aws_route_table" "rtb_2nd" {
    vpc_id = aws_vpc.my_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_igw.id
    }

    tags = {
        Name = "2nd Route Table"
    }
}

resource "aws_route_table_association" "public_subnet_asso" {
    count = length (var.public_subnet_cidr)
    subnet_id = element(aws_subnet.public_subnet[*].id, count.index)
    route_table_id = aws_route_table.rtb_2nd.id
}