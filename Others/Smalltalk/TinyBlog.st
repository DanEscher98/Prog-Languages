Object subclass: #TBpost
	instanceVariableNames: 'title text date category visible'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TinyBlog'!

	!TBpost methodsFor: 'accessing' STAMP!
	title
		^title
	! !

	!TBpost methodsFor: 'accessing' STAMP!
	title: aString
		title := aString
	! !

	!TBpost methodsFor: 'accessing' STAMP!
	text:
		^text
	! !

	!TBpost methodsFor: 'accessing' STAMP!
	text: aString
		text := aString
	! !

	!TBpost methodsFor: 'accessing' STAMP!
	date: aDate
		date := aDate
	! !

	!TBpost methodsFor: 'accessing' STAMP!
	date
		^date
	! !

	!TBpost methodsFor: 'accessing' STAMP!
	category: anObject
		category := anObject
	! !

	!TBpost methodsFor: 'accessing' STAMP!
	category
		^category
	! !

	!TBpost methodsFor: 'accessing' STAMP!
	visible: aBoolean
		visible := aBoolean
	! !

	!TBpost methodsFor: 'accessing' STAMP!
	visible
		^visible
	! !

	!TBpost methodsFor: 'action' STAMP!
	beVisible
		self visible: true.
	! !

	!TBpost methodsFor: 'action' STAMP!
	notVisible
		self visible: false
	! !
