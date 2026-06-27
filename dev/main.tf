module vpc {
    source = "../Modules/vpc"
    cidr = var.cidr
}


module igw {
    source = "../Modules/igw"
    vpc_id = module.vpc.vpc_id
}


module subnet {
    source = "../Modules/subnet"
    vpc_id = module.vpc.vpc_id
}

module route {
    source = "../Modules/route"
    igwid = module.igw.igwid
    vpc_id = module.vpc.vpc_id
    natgw = module.nat.natgw
    Public = module.subnet.Public
    Private = module.subnet.Private

}

module nat {
    source = "../Modules/NAT"
    igwid = module.igw.igwid
    eip = module.eip.eip
    Public = module.subnet.Public

}

module eip {
    source = "../Modules/eip"

}

module secgroup {
    source = "../Modules/Secgrp"
    vpc_id = module.vpc.vpc_id

}

module ec2 {
    source = "../Modules/ec2"
    public_sec = module.secgroup.public_sec
    private_sec = module.secgroup.private_sec
    providers = {
    aws.prod = aws.mumbai        # ← FILLS the slot
    }

}