output public_sec {

    value = aws_security_group.port22.id
}

output private_sec {

    value = aws_security_group.egress_only.id
}