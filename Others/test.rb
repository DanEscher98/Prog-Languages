#!/usr/bin/env ruby

class Gear
	attr_reader :chainring, :cog, :rim, :tire
	def initialize(chainring, cog, rim, tire)
		@chainring  = chainring
		@cog 		= cog
		@rim 		= rim
		@tire 		= tire 
	end
	def ratio
		chainring/cog.to_f
	end
	def gear_inches
		# tire goes around rim twice for diameter
		ratio*(rim+(tire*2))
	end
end

puts Gear.new(52,11,26,1.5).gear_inches
puts Gear.new(52,11,24,2.25).gear_inches

class Obscuring
	attr_reader :data
	def initialize(data)
		@data = data
	end
	def diameters
		data.collect {|cell|
			cell[0] + cell[1]*2}
	end
end

@data = [[622,20], [622,23], [559,30], [559,40]]