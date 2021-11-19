#!/usr/bin/env ruby

class Player
	attr_accessor :name, :health, :power
	def initialize(n, h, p)
		@name 	= n
		@health = h
		@power 	= p
	end
	def isAlive
		@power.to_i > 0
	end
	def hit(opponent)
		opponent.health -= self.power
	end
	def to_s
		"#{name}: Health:#{health} Power:#{power}"
	end
end

def fight(p1, p2)
	while p1.isAlive && p2.isAlive
		p1.hit(p2)
		p2.hit(p1)
		show_info(p1, p2)
	end

	if p1.isAlive
		puts "#{p1.name} WON!"
	elsif p2.isAlive
		puts "#{p2.name} WON!"
	else
		puts "TIE!"
	end
end

def show_info(*p)
	p.each {|x| puts x}
end

p1 = Player.new("Player 1", 1+rand(100), 1+rand(20))
p2 = Player.new("Player 2", 1+rand(100), 1+rand(20))

show_info(p1, p2)
fight(p1, p2)
