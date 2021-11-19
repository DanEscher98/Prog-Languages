#! /usr/bin/gst -f
"This is an easy program"

| userName |
Transcript show: 'What''s your name?: '.
userName := stdin nextLine.
Transcript show: ('Hello ', userName, '!'); cr

Object subclass: Animal [
	| name |
	animalNumber := 0.
	<comment: 'A class for defining animals.'>

	Animal class >> setAnimalNumber: number [
		<category: 'accessing'>
		animalNumber := number.
		^animalNumber
	]

	Animal class >> getAnimalNumber [
		<category: 'accessing'>
		^animalNumber
	]

	setName: newName [
		<category: 'accessing'>
		name := newName.
	]

	getName [
		<category: 'accessing'>
		^name
	]
]

Animal subclass: Dog [
	<comment: 'A dog class.'>

	makeNoise [
		"An instance method to get the dog's noise."
		<category: 'accessing'>
		'Woof!' printNl.
	]
]

Animal subclass: Cat [
	<comment: 'A cat class.'>

	makeNoise [
		"An instance method to get the cat's noise."
		<category: 'accessing'>
		'Meow!' printNl.
	]
]

dog1 := Dog new.
Animal setAnimalNumber: 1.
dog1 setName: 'Rufus'.
dog1 getName printNl.
dog1 makeNoise.

cat1 := Cat new.
Animal setAnimalNumber: 1.
cat1 setName: 'Tiger'.
cat1 getName printNl.
cat1 makeNoise.
