Object subclass: #Watch
	instanceVariableNames: 'style cost'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Watches'!

	!Watch methodsFor: 'accessing' STAMP!
	style: aStyle
		style := aStyle.
	! !

	!Watch methodsFor: 'accessing' STAMP!
	cost: aCost
		cost := aCost.
	! !

	!Watch methodsFor: 'accessing' STAMP!
	style
		^style
	! !

	!Watch methodsFor: 'accessing' STAMP!
	cost
		^cost
	! !

Watch subclass: #WaterProof
   	instanceVariableNames: 'depth'
   	classVariableNames: ''
   	poolDictionaries: ''
   	category: 'Watches'!

   	!WaterProof methodsFor: 'accessing' STAMP!
	depth: aDepth
		depth := aDepth.
   	! !

	!WaterProof methodsFor: 'accessing' STAMP!
	depth
		^depth
	! !
