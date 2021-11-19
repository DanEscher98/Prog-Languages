#! /usr/bin/gst -f

Object subclass: Hello [
	greet [
			'Hello, World' displayNl
	]
].


Object subclass: Account [
	| balance |
	<comment: 'I represent a place to deposite money'>

	Account class >> new [
		| r |
		<category: 'instance creation'>
		r := super new.
		r init.
		^r
	]

	init [
		<category: 'initialization'>
		balance := 0
	]

	printOn: stream [
        <category: 'printing'>
        super printOn: stream.
        stream nextPutAll: ' with balance: '.
        balance printOn: stream
    ]

	deposit: amount [
		<category: 'moving money'>
		balance := balance + amount
	]

].


greeting := Hello new.
greeting greet.

a := Account new.
a deposit: 10.
a.

ObjectMemory snapshot: 'mysnap.im'
