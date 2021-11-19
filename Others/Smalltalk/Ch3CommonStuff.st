#!/usr/bin/gst -f

| anArray aSet bSet aDictionary var |

anArray := Array new: 10.
anArray at: 2 put: 'HairBrush'.
anArray := anArray reverse.

"(anArray includes: 'HairBrush') ifTrue: [

]"

Transcript show: (anArray printString); cr.

aSet := Set new.
aSet add: 'Bike'.
aSet add: 'Scutter'.
bSet := Set new.
bSet add: (aSet remove: 'Bike').

Object subclass: Human [
	| Age |
	setAge: age [
		Age := age.
	]
]

aDictionary := Dictionary new.
aDictionary at: 'Larry' put: (Human new).
aDictionary at: 'Bob' put: (Human new).
Transcript show: (aDictionary printString);cr.

greetings :=
	[:platesOfCornFlakes :var|
	'I have eaten ', platesOfCornFlakes printString,
	' plates of corn flakes this morning', var].

checker := [:var|
	var ifTrue: [
		'Our variable is true.'.
	] ifFalse: [
		'Our variable is false.'.
	]
].

Transcript show: ('Hello ma! ', (greetings value: 3 value: '?')) printString;cr.
Transcript show: (checker value:true); cr.


| sum enteredIntegers lastEnteredInteger |

sum := 0.
enteredIntegers := 0.

[ lastEnteredInteger ~= -1 ] whileTrue: [
	Transcript cr; show: 'Please enter a number. To exit the program enter -1: '.
	lastEnteredInteger := stdin nextLine asInteger.
	sum := sum + lastEnteredInteger.
	enteredIntegers := enteredIntegers + 1.
	Transcript show: 'The average of the numbers entered so far is: ', (sum / enteredIntegers) printString; cr.
]

1 to: 5 do: [:x |
	Transcript show: 'This is the ', x printString, '. line.'; cr.
]

5 to: 1 by: -1 do: [:x |
	Transcript show: 'This is the ', x printString, '. line.'; cr.
	Transcript show: (10 bitAt: x put: 1) printString; cr.
]


1 to: 10 do: [:x |
	(x between: 4 and: 7) ifTrue: [
		'uwu' printNl.
	] ifFalse: [
		'owo' printNl.
	]
].
