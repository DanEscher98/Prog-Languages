sys = modules::import('klmr/sys')

f = function(x) {
    x + a
}

sys$run({
    a = 50
    sys$print(f(5))
})