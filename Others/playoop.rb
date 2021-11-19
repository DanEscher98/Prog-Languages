#!/usr/bin/env ruby

class Animal
    @@count = 0
    attr_accessor :name, :age
    def initialize(name, age)
        @@count += 1
        @name = name
        @age  = age
    end
    def to_s
        "#{@name} is #{@age} years old."
    end
    def get_count
        @@count
    end
end

class Dog < Animal
end

class Shape
    attr_accessor :h, :w
    def initialize(h, w)
        self.h = h
        self.w = w
    end
    def +(other)
        Shape.new(self.h+other.h, self.w+other.w)
    end
    def to_s
        "The height=#{@h} and weigth=#{@w}"
    end
end

class Square
    attr_accessor :side
    def initialize(side)
        @side = side
    end
    def to_s
        "My side is #{@side}"
    end
    def +(other)
        Square.new(Math.sqrt(@side**2 + other.side**2))
    end
end





a1 = Animal.new("Lucius", 7)
s1 = Shape.new(2, 3)
s2 = Shape.new(3, 4)
s3 = s1 + s2
sq1 = Square.new(4)

puts s3
puts sq1+sq1
