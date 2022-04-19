variable "env" {
    type = string
    description = "This represents the environment"
}

variable "ports" {
    type = list     //list(any)
    description = "A list for my ports"
    default = [{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    },
    {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }]
}