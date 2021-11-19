Object subclass: #Person
	instanceVariableNames: 'firstName lastName birthday'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Person-package'!

	!Person methodsFor: 'accessing' STAMP!
	firstName: aName
		firstName := aName.
	! !

	!Person methodsFor: 'accessing' STAMP!
	firstName
		^firstName
	! !

	!Person methodsFor: 'accessing' STAMP!
	lastName: aName
		lastName := aName.
	! !

	!Person methodsFor: 'accessing' STAMP!
	lastName
		^lastName
	! !

	!Person methodsFor: 'accessing' STAMP!
	birthday: aDate
		birthday := aDate.
	! !

	!Person methodsFor: 'accessing' STAMP!
	birthday
		^birthday
	! !

	!Person methodsFor: 'queries' STAMP!
	age
		^(Date today year - birthday year)
	! !

	!Person methodsFor: 'queries' STAMP!
	introduceYourself
		Transcript show: ('My name is: ', self firstName, ' ', self lastName,'.'); cr.
	! !
