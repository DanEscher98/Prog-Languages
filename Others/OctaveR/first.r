integral = function(a, b) {
	acc <- 0.0001
	n = strtoi((b-a)/acc)
	delta_x = (b-a)/n
	s <- 0
	for(i in 1:n){
		x_i <- a + (i-0.5)*delta_x
		s <- s + f(x_i)*delta_x
	}
    return(s)
}

f = function(x){
	return(sin(x))
}

main = function(){
	a <- readline(prompt = "Set a: ")
	b <- readline(prompt = "Set b: ")
	if (is.nan(a)) {a, b <- 0, 2}
	a = as.numeric(a); b = as.numeric(b)
	ans <- integral(a, b)
	print('I[f(x)] with')
	print(paste('a = ', a))
	print(paste('b = ', b))
	print(paste('is equal to: ', ans))
}

if(getOption("numI.main", default=TRUE)){
   main()
}