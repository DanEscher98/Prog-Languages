#!/usr/bin/gst -f

myAdd := [:aNumber|
	| result |
	result := aNumber + 10.
	^result.
].

Transcript show: (myAdd value:10) printString; cr
