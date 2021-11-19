#!/usr/bin/env ruby

class Integral
	def initialize(a, b)
		@a = a
		@b = b
		@n = Integer((b-a)/0.0001)
		@delta_x = (b-a)/n
		@sum = 0

		for i in 1..n do
			@x_i = a + (i-0.5)*delta_x
			sum += Math.sin(x_i)*delta_x
		end
	end
	def result
		puts "I[sin(x)] with"
		puts "\na = "+@a
		puts "\nb = "+@b
		puts "\nis equal to: "+@sum
	end
end

hi = Integral.new(0, 2)
hi.hello_matz # => Hello, Matz!
