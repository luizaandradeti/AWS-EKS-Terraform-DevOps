resource "aws_subnet" "eks_subnet_private_1a" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "${data.aws_region.current.name}a"

  tags = {
      Name= "${var.project_title}-priv-subnet-1a",
      "kubernetes.io/role/internal-elb" = 1
    }
  }

resource "aws_subnet" "eks_subnet_private_1b" {
  vpc_id            = aws_vpc.eks_vpc.id
   cidr_block        = "10.0.1.0/24"
  availability_zone = "${data.aws_region.current.name}b"


  tags = {
      Name= "${var.project_title}-priv-subnet-1b",
      "kubernetes.io/role/internal-elb" = 1
    
    }
  }

resource "aws_subnet" "eks_subnet_public_1a" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "${data.aws_region.current.name}a"
  map_public_ip_on_launch = true

  tags = {
     Name= "${var.project_title}-pub-subnet-1a",
     "kubernetes.io/role/elb" = 1
  }
}

resource "aws_subnet" "eks_subnet_public_1b" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true

    tags =  {
      Name= "${var.project_title}-pub-subnet-1b", 
      "kubernetes.io/role/elb" = 1


    }
  
}
