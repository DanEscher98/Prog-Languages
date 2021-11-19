#! /usr/bin/gst -f

Object subclass: Human [
	| age name |
	setName: aName [
		name := aName.
	]
	setAge: aAge [
		age := aAge.
	]
	getName [
		^name
	]
	getAge [
		^age
	]
	introduceYourself [
		Transcript show: ('Hi, my name is ', self getName, ' and I''m ', (self getAge) printString, ' years old.'); cr.
	]
	> aHuman [
		^(self getAge > aHuman getAge)
	]
	< aHuman [
		^(self getAge < aHuman getAge)
	]
	= aHuman [
		^(self getAge = aHuman getAge)
	]
]

| me myBrother |

me := Human new.
me setName: 'Daniel'.
me setAge: 23.
myBrother := Human new.
myBrother setName: 'Efrain'.
myBrother setAge: 16.

me introduceYourself.
myBrother introduceYourself.

(me > myBrother) printNl.
