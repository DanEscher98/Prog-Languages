Object subclass: #Person
	instanceVariableNames: 'firstName lastName birthday'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Person-package'!

	!Person methodsFor: 'accessing' stamp: 'Dany98 07/04/2021 13:55'!
	firstName: aName
		firstName := aName.
	! !

	!Person methodsFor: 'accessing' stamp: 'Dany98 07/04/2021 13:55'!
	firstName
		^firstName
	! !

	!Person methodsFor: 'accessing' stamp: 'Dany98 07/04/2021 13:55'!
	lastName: aName
		lastName := aName.
	! !

	!Person methodsFor: 'accessing' stamp: 'Dany98 07/04/2021 13:55'!
	lastName
		^lastName
	! !

	!Person methodsFor: 'accessing' stamp: 'Dany98 07/04/2021 13:55'!
	birthday: aDate
		birthday := aDate.
	! !

	!Person methodsFor: 'accessing' stamp: 'Dany98 07/04/2021 13:55'!
	birthday
		^birthday
	! !

	!Person methodsFor: 'queries' stamp: 'Dany98 07/04/2021 13:55'!
	age
		^(Date today year - birthday year)
	! !

	!Person methodsFor: 'queries' stamp: 'Dany98 07/04/2021 13:55'!
	introduceYourself
		Transcript show: ('My name is: ', self firstName, ' ', self lastName,'.'); cr.
	! !