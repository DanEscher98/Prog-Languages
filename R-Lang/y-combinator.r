y <- function(f) {
    (function(x) {
         (x)(x)
    })(function(h) {
        f(function(a) {
              (h)(h)(a)})})
}

fact <- function(f) {
    function(n) {
        if (n < 2)
            1
        else
            n * f(n - 1)
    }
}

# terminal source("y-combinator.r")
# terminal for(i in 1:9) print(y(fact)(i))
