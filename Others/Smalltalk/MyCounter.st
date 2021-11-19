Object subclass: #Counter
	instanceVariableNames: 'count'
	classVariableNames: ''
	package: 'MyCounter'!

	!Counter commentStamp: 'Dany98 4/9/2021 10:42' prior: 0!
	Counter is a simple concrete class which supports incrementing anddecrementing a counter.
	Its API is- decrement, increment- countIts creation API is message startingAt:!

	!Counter methodsFor: 'accessing' stamp: 'Dany98 4/9/2021 10:53'!
	count
		^ count
	! !

	!Counter methodsFor: 'accessing' stamp: 'Dany98 4/9/2021 11:20'!
	count: aNumber
		count := aNumber.
	! !

	!Counter methodsFor: 'operations' stamp: 'Dany98 4/9/2021 11:23'!
	increment
		count := count + 1.
	! !

	!Counter methodsFor: 'operations' stamp: 'Dany98 4/9/2021 11:23'!
	decrement
		count := count - 1.
	! !

	!Counter methodsFor: 'initialization' stamp: 'Dany98 4/9/2021 12:43'!
	initialize
		self count: 0.
	! !

	"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "
	!Counter class	instanceVariableNames: ''!

	!Counter class methodsFor: 'accessing' stamp: 'Dany98 4/9/2021 12:50'!
	startingAt: aNumber
		^self new count: aNumber.
	! !

TestCase subclass: #CounterTest
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'MyCounter'!

	!CounterTest commentStamp: '<historical>' prior: 0!
	A CounterTest is a test class for testing the behavior of Counter!

	!CounterTest methodsFor: 'tests' stamp: 'Dany98 4/9/2021 11:16'!
	testIncrement
		| c |
		c := Counter new.
		c count: 0; increment; increment.
		self
			assert: c count
			equals: 2.
	! !

	!CounterTest methodsFor: 'tests' stamp: 'Dany98 4/9/2021 11:22'!
	testDecrement
		| c |
		c := Counter new.
		c count: 0; decrement; decrement.
		self
			assert: c count
			equals: -2.
		! !

	!CounterTest methodsFor: 'tests' stamp: 'Dany98 4/9/2021 10:59'!
	testCountIsSetAndRead
		| c |
		c := Counter new.
		c count: 7.
		self
			assert: c count
			equals: 7
	! !

	!CounterTest methodsFor: 'tests' stamp: 'Dany98 4/9/2021 12:40'!
	testCounterStartAt5
		self
			assert: (Counter startAt: 5) count
			equals: 5.
	! !

	!CounterTest methodsFor: 'tests' stamp: 'Dany98 4/9/2021 12:46'!
	testCounterWellInitialized
		self
			assert: (Counter new increment; increment; count)
			equals: 2.
	! !

	!CounterTest methodsFor: 'tests' stamp: 'Dany98 4/9/2021 12:49'!
	testAlternateCreationMethod
		self
			assert: ((Counter startingAt: 19) increment ; count)
			equals: 20
	! !
