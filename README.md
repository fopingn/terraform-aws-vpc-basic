**AWS VPC module for terraform**

**A simple VPC module for Terraform.**

**Usage**

module &quot;vpc&quot; {

source = &quot;https://github.com/fopingn/terraform-aws-vpc-basic.git&quot;

name = &quot;vpc\_name&quot;

cidr = &quot;10.0.0.0/16&quot;

enable\_dns\_hostnames = true

enable\_dns\_support = true

public\_subnet = &quot;10.0.1.0/24&quot;

public\_subnets = [&quot;10.0.20.0/24&quot;,&quot;10.0.21.0/24&quot;,&quot;10.0.22.0/24&quot;]

private\_subnets = [&quot;10.0.120.0/24&quot;,&quot;10.0.121.0/24&quot;,&quot;10.0.122.0/24&quot;]

azs = [&quot;us-east-2a&quot;,&quot;us-east-2b&quot;,&quot;us-east-2c&quot;]

tags = {

      Owner = XXXXX

      Environment = XXXXX

}

vpc\_tags = {

  Name = XXXXX

  }

igw\_tags = {

    Name = XXXXX

  }

public\_subnet\_tags = {

      Name = XXXXX

    }

private\_subnet\_tags = {

        Name = XXXXX

      }

}

Note: You have to give several values to tag in all above tags

## License

MIT
