"
This is an example with Watches
Its API is
- sytle, cost

"
Class {
	#name: #Watch,
	#superclass: #Object,
	#instVars: [
		'count'
	],
	#category: #MyWatch
	}

{ #category: #accessing }
Watch >> sytle [
	^style
]

{ #category: #accessing }
Watch >> style: aString [
	sytle := aString.
]

{ #category: #accessing }
Watch >> cost [
	^cost
]

{ #category: #accessing }
Watch >> cost: aNumber [
	cost := aNumber.
]

{ #category: #initialization }
Watch >> initialize [
	self sytle: 'none'.
	self cost: 0.
]

{ #category: #printing}
Watch >> printString [
	^'a Watch with style: ', style, ' cost: ', cost printString.
]
