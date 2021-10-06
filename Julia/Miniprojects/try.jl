#!/home/dany98/.julia/julia-1.6.0/bin/julia
using ArgParse
using Pkg; Pkg.activate()

function parse_commandline()
    s = ArgParseSettings("Program to calc the nth root of a complex number")
    @add_arg_table! s begin
        "a"
            help = "The real part of the radicand"
            arg_type = Float16
            required = true
        "b"
            help = "The imaginary part of the radicand"
            arg_type = Float16
            required = true
        "index"
            help = "Tells what root is being taken"
            arg_type = Int
            default = 2
        "--numerical", "-n"
            help = "Give the numerical answer"
            action = :store_true
        "--plot", "-p"
            help = "Option to plot the answer"
            action = :store_true
    end
    return parse_args(s, as_symbols=true)
end

function main()
    parsed_args = parse_commandline()
    println("Parsed args:")
    for (arg,val) in parsed_args
        println("\t$arg  =>  $val")
    end
    print(parsed_args[:a])
end

main()
