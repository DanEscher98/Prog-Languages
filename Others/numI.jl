const acc = 0.0001

f(x) = sin(x)

function integral(a::Float64, b::Float64)
    global acc
    n = trunc(Int, (b-a)/acc)
    delta_x = (b-a)/n
    s = 0
    for i in 1:n
        x_i = a + (i-0.5)*delta_x
        s += f(x_i)*delta_x
    end
    return s
end

function main()
    print("Set a: ")
    a = parse(UInt8, readline())
    print("Set b: ")
    b = parse(UInt8, readline())
    ans = integral(a, b)
    println("I[sin(x)] with")
    println("a = $a")
    println("b = $b")
    println("is equal to: $ans")
end

main()